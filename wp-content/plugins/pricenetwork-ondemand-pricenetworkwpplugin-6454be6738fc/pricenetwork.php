<?php
/*
Plugin Name: PriceNetwork Search Plugin
Plugin URI: https://www.campusbooks.com/
Description: Include searching for book prices through the PriceNetwork!
Version: 0.0.1
Author: PriceNetwork, Inc.
Author URI: https://www.campusbooks.com/
License: Proprietary
*/

require_once(dirname(__FILE__) . '/widgets/search-sidebar.php');
require_once(dirname(__FILE__) . '/classes/PriceNetworkAPIWrapper.php');
require_once(dirname(__FILE__) . '/classes/PriceNetworkISBNHelper.php');

class PNAPISearch
{
    function PNAPISearch()
    {
        add_action( 'widgets_init' , array(&$this, 'register_widgets') );

        if ( is_admin() )
        {
            add_action( 'admin_menu', array(&$this, 'plugin_menu') );
            add_action( 'admin_init', array(&$this, 'register_settings') );
        }

        add_filter('the_content', array(&$this, 'attach_search_results') );
        add_shortcode( 'pnsearchbookform', array(&$this, 'get_short_code'));
    }

    function get_short_code( $atts )
    {
        $a = shortcode_atts( array(
            'title' => 'Search Books',
        ), $atts );

        $search_page = get_option('pricenetwork_search_page');
        $page = null;

        if( isset($search_page['page_id']) && !empty($search_page['page_id']) )
        {    
            $page = get_post($search_page['page_id']);
        }

        if ( $page )
        {
            $permalink = get_permalink($page->ID); 
            $placeholder = 'Search here to BUY, RENT and SELL textbooks';
            $button = 'Search';

            $form = <<<PNFORM
<form id="pnsearchform" method="get" action="{$permalink}">
<h3>{$a['title']}</h>
<table>
<tr>
    <td>
        <input style="width: 100%;" type="text" name="pnqs" id="pnqs" value="" placeholder="{$placeholder}" />
    </td>
    <td align="left">
        <button class="search_book_btn" onclick="search_book()" type="button" >$button</button>
    </td>
</tr>
</table>
</form>
PNFORM;

            return $form;
        }
        else
        {
            return "No search page has been selected.";
        }
    }

    function attach_search_results($content)
    {
        $search_page = get_option('pricenetwork_search_page');
        $pcbuy_page = get_option('pricenetwork_pcbuy_page');
        $pcsell_page = get_option('pricenetwork_pcsell_page');
        $api_key = get_option('pricenetwork_api_key');
        $page_search = null;
        $page_pcbuy = null;
        $page_pcsell = null;

        if( isset($search_page['page_id']) && !empty($search_page['page_id']) )
        {    
            $page_search = get_post($search_page['page_id']);
        }
        if( isset($pcbuy_page['page_id']) && !empty($pcbuy_page['page_id']) )
        {    
            $page_pcbuy = get_post($pcbuy_page['page_id']);
        }
        if( isset($pcsell_page['page_id']) && !empty($pcsell_page['page_id']) )
        {    
            $page_pcsell = get_post($pcsell_page['page_id']);
        }

        if( is_singular() && is_main_query() )
        {
            if( !empty($api_key) )
            {
                if( $page_search && $GLOBALS['post']->ID === $page_search->ID )
                {
                    //Render a search results page...
                    if( isset($_GET['pnqs']) && !empty($_GET['pnqs']) )
                    {
                        $content .= $this->renderSearchResults($_GET['pnqs'], $api_key);
                    }
                    else
                    {
                        if( !isset($_GET['pncomparebook']) || empty($_GET['pncomparebook']) ) //Prevent message from showing when everything is set to teh same page
                        {
                            $content .= '';
                        }
                    }                    
                }
                if( $page_pcbuy && $GLOBALS['post']->ID === $page_pcbuy->ID )
                {
                    if ( isset($_GET['pncomparebook']) && !empty($_GET['pncomparebook']) && isset($_GET['pnisbn']) && !empty($_GET['pnisbn']) && $_GET['pncomparebook'] === 'buy' ) 
                    {
                        $content .= $this->renderBuyPage($_GET['pnisbn'], $api_key);
                    }
                }
                if( $page_pcsell && $GLOBALS['post']->ID === $page_pcsell->ID )
                {
                    if ( isset($_GET['pncomparebook']) && !empty($_GET['pncomparebook']) && isset($_GET['pnisbn']) && !empty($_GET['pnisbn']) && $_GET['pncomparebook'] === 'sell' ) 
                    {
                        $content .= $this->renderSellPage($_GET['pnisbn'], $api_key);
                    }
                }
            }
            else
            {
                $content .= '<h2>You have not set your API KEY in the plugin settings.</h2>';
            }
        }

        return $content;
    }

    function renderBuyPage($isbn, $api_key)
    {
        $isbn = sanitize_text_field($isbn);

        if( PriceNetworkISBNHelper::validateIsbn($isbn) )
        {
            $api = new PriceNetworkAPIWrapper($api_key);
            
            $results = json_decode($api->getBuyPrices($isbn));

            $content = '';

            $pcsell_page = get_option('pricenetwork_pcsell_page');
            $page_pcsell = null;

            if( isset($pcsell_page['page_id']) && !empty($pcsell_page['page_id']) )
            {    
                $page_pcsell = get_post($pcsell_page['page_id']);
            }

            if ( isset($results->response->page->books->book) && is_array($results->response->page->books->book) && !empty($results->response->page->books->book) )
            {
                $book = $results->response->page->books->book[0];
                $booklinksell = isset($page_pcsell->ID) ? (get_permalink($page_pcsell->ID) . '?pncomparebook=sell&pnisbn=' . $book->isbn13) : '';

                $content = '<h2>' . $book->title .  '</h2>';

                $bookinfo = <<<BOOKINFO
<table>
    <tr>
        <td width="30%" valign="top">
            <img alt="{$book->title}" src="{$book->image->image}" />
        </td>
        <td>
            <dl>
                <dt><strong>Authors</strong>: {$book->author}</dt>
                <dt><strong>ISBN 10</strong>: {$book->isbn10}</dt>
                <dt><strong>ISBN 13</strong>: {$book->isbn13}</dt>
                <dt><strong>Edition</strong>: {$book->edition}</dt>
                <dt><strong>Released</strong>: {$book->publish_date}</dt>
                <dt><strong>Format</strong>: {$book->binding}</dt>
                <dt><strong>List Price</strong>: \${$book->msrp}</dt>
                <dt>&#10010; <a href="{$booklinksell}">Sell this book</a></dt>
            </dl>
        </td>
    </tr>
</table>
BOOKINFO;
                $content .= $bookinfo;

                $offers = array();

                foreach($book->offers->group as $group)
                {
                    foreach($group->offer as $offer)
                    {
                        if( $offer->price > 1 )
                        {
                            $offers[] = $offer;
                        }
                    }
                }

                //Sort all offers
                usort($offers,function($a, $b){

                    if ( $a->price == $b->price )
                    {
                        return 0;
                    }

                    return ( $a->price < $b->price ) ? -1 : 1;
                });

                //Determine the best!
                $bestoffers = array();
                foreach($offers as $k=>$offer)
                {
                    if(!isset($bestoffers[$offer->condition->condition]))
                    {
                        $bestoffers[$offer->condition->condition] = $offer;
                        unset($offers[$k]);
                    }
                }

                $content .= '<h3>Best Prices</h3><table>';
                $content .= '<tr><th>Seller</th><th>Condition</th><th>Price</th><th>Shipping<th>Coupons</th><th>Total (w/tax)</th><th>&nbsp</th></tr>';
                foreach( $bestoffers as $offer )
                {
                    $actioncopy = $offer->condition->condition === 'Rental' ? 'Rent' : 'Buy';
                    $conditioncopy = $offer->condition->condition === 'Rental' ? ($offer->condition->condition . ' ' . $offer->rentals->rental[0]->days . ' days') : $offer->condition->condition;
                    $bookinfocopy = '<dl><dt><strong>Availability:</strong> ' . $offer->availability->availability .  '</dt><dt><strong>Merchant details:</strong> ' . $offer->merchant->notes .  '</dt><dt><strong>Notes:</strong> ' . $offer->comments .  '</dt></dl>';

                    $couponcopy = '';
                    $couonflag = '';

                    if( isset($offer->coupon_available->coupon) && !empty($offer->coupon_available->coupon) && is_array($offer->coupon_available->coupon) )
                    {
                        $couponflag = '<span title="Click to show coupon!" onclick="jQuery(this).parent().parent().next().next().toggle();" style="cursor: pointer;">&#x2714;</span>';
                        $couponcopy = '<dl>';
                        foreach ( $offer->coupon_available->coupon as $coupon )
                        {
                            $couponcopy .= '<dt><div>' . ($coupon->desc_short) . '</div><div>' . (!empty($coupon->code) ? ('Use Code: ' . $coupon->code) : '') . '</div><div>' . ('Expires: ' . $coupon->expires) . '</div></dt>';
                        }
                        $couponcopy .= '</dl>';
                    }

                    $content .= <<<OFFERS
<tr>
    <td align="left"><img src="{$offer->merchant->image}" alt="{$offer->merchant->name}" title="{$offer->merchant->name}" /></td>
    <td align="left">{$conditioncopy} <span style="cursor: pointer;" onclick="jQuery(this).parent().parent().next().toggle();"><strong>&#10010;</strong></span></td>
    <td align="right">\${$offer->price}</td>
    <td align="right">\${$offer->shipping}</td>
    <td align="center">{$couponflag}</td>
    <td align="right">\${$offer->total}</td>
    <td align="center"><a target="_blank" href="{$offer->link}"><button>{$actioncopy}</button></a></td>
</tr>                    
<tr class="bookdetails" style="display: none;">
    <td>&nbsp;</td>
    <td colspan="6">{$bookinfocopy}</td>
</tr>
<tr class="bookcoupons" style="display: none;">
    <td>&nbsp;</td>
    <td colspan="6">{$couponcopy}</td>
</tr>
OFFERS;
                }
                $content .= '</table>';

                $content .= '<h3>All Bookstores</h3><table>';
                $content .= '<tr><th>Seller</th><th>Condition</th><th>Price</th><th>Shipping<th>Coupons</th><th>Total (w/tax)</th><th>&nbsp</th></tr>';
                foreach( $offers as $offer )
                {
                    $actioncopy = $offer->condition->condition === 'Rental' ? 'Rent' : 'Buy';
                    $conditioncopy = $offer->condition->condition === 'Rental' ? ($offer->condition->condition . ' ' . $offer->rentals->rental[0]->days . ' days') : $offer->condition->condition;
                    $bookinfocopy = '<dl><dt><strong>Availability:</strong> ' . $offer->availability->availability .  '</dt><dt><strong>Merchant details:</strong> ' . $offer->merchant->notes .  '</dt><dt><strong>Notes:</strong> ' . $offer->comments .  '</dt></dl>';

                    $couponcopy = '';
                    $couponflag = '';

                    if( isset($offer->coupon_available->coupon) && !empty($offer->coupon_available->coupon) && is_array($offer->coupon_available->coupon) )
                    {
                        $couponflag = '<span title="Click to show coupon!" onclick="jQuery(this).parent().parent().next().next().toggle();" style="cursor: pointer;">&#x2714;</span>';
                        $couponcopy = '<dl>';
                        foreach ( $offer->coupon_available->coupon as $coupon )
                        {
                            $couponcopy .= '<dt><div>' . ($coupon->desc_short) . '</div><div>' . (!empty($coupon->code) ? ('Use Code: ' . $coupon->code) : '') . '</div><div>' . ('Expires: ' . $coupon->expires) . '</div></dt>';
                        }
                        $couponcopy .= '</dl></div>';
                    }

                    $content .= <<<OFFERS
<tr>
    <td align="left"><img src="{$offer->merchant->image}" alt="{$offer->merchant->name}" title="{$offer->merchant->name}" /></td>
    <td align="left">{$conditioncopy} <span style="cursor: pointer;" onclick="jQuery(this).parent().parent().next().toggle();"><strong>&#10010;</strong></span></td>
    <td align="right">\${$offer->price}</td>
    <td align="right">\${$offer->shipping}</td>
    <td align="center">{$couponflag}</td>
    <td align="right">\${$offer->total}</td>
    <td align="center"><a target="_blank" href="{$offer->link}"><button>{$actioncopy}</button></a></td>
</tr>                    
<tr class="bookdetails" style="display: none;">
    <td>&nbsp;</td>
    <td colspan="6">{$bookinfocopy}</td>
</tr>
<tr class="bookcoupons" style="display: none;">
    <td>&nbsp;</td>
    <td colspan="6">{$couponcopy}</td>
</tr>
OFFERS;
                }
                $content .= '</table>';
                
            }

            return $content;
        }
        else
        {
            return '<p>Invalid ISBN.</p>';
        }
    }
    
    function renderSellPage($isbn, $api_key)
    {
        $isbn = sanitize_text_field($isbn);

        if( PriceNetworkISBNHelper::validateIsbn($isbn) )
        {
            $api = new PriceNetworkAPIWrapper($api_key);
            
            $results = json_decode($api->getSellPrices($isbn));

            $content = '';
            
            $pcbuy_page = get_option('pricenetwork_pcbuy_page');
            $page_pcbuy = null;

            if( isset($pcbuy_page['page_id']) && !empty($pcbuy_page['page_id']) )
            {    
                $page_pcbuy = get_post($pcbuy_page['page_id']);
            }

            if ( isset($results->response->page->books->book) && is_array($results->response->page->books->book) && !empty($results->response->page->books->book) )
            {
                $book = $results->response->page->books->book[0];
                $booklinksell = isset($page_pcbuy->ID) ? (get_permalink($page_pcbuy->ID) . '?pncomparebook=buy&pnisbn=' . $book->isbn13) : '';

                $content = '<h2>' . $book->title .  '</h2>';

                $bookinfo = <<<BOOKINFO
<table>
    <tr>
        <td width="30%" valign="top">
            <img alt="{$book->title}" src="{$book->image->image}" />
        </td>
        <td>
            <dl>
                <dt><strong>Authors</strong>: {$book->author}</dt>
                <dt><strong>ISBN 10</strong>: {$book->isbn10}</dt>
                <dt><strong>ISBN 13</strong>: {$book->isbn13}</dt>
                <dt><strong>Edition</strong>: {$book->edition}</dt>
                <dt><strong>Released</strong>: {$book->publish_date}</dt>
                <dt><strong>Format</strong>: {$book->binding}</dt>
                <dt><strong>List Price</strong>: \${$book->msrp}</dt>
                <dt>&#10010; <a href="{$booklinksell}">Buy this book</a></dt>
            </dl>
        </td>
    </tr>
</table>
BOOKINFO;
                $content .= $bookinfo;

                $offers = array();

                foreach($book->offers->group as $group)
                {
                    foreach($group->offer as $offer)
                    {
                        if( $offer->price > 1 )
                        {
                            $offers[] = $offer;
                        }
                    }
                }

                //Sort all offers
                usort($offers,function($a, $b){

                    if ( $a->price == $b->price )
                    {
                        return 0;
                    }

                    return ( $a->price < $b->price ) ? -1 : 1;
                });

                $content .= '<h3>Buyback</h3><p>(Sell directly to one of these merchants and get cash immediately)</p><table>';
                $content .= '<tr><th>Bookstore</th><th>&nbsp;</th><th>Payment</th><th>Good Condition</th><th>Bonus Offers</th><th>&nbsp</th></tr>';
                foreach( $offers as $offer )
                {
                    $actioncopy = 'Sell';
                    $conditioncopy = '';
                    $bookinfocopy = '<dl><dt><strong>Shipping Details:</strong> ' . $offer->merchant->notes .  '</dt></dl>';

                    $offer->paymentType = 'cash';
                    if($offer->merchant->id == '124')
                    {
                       $offer->paymentType = 'credit';
                    }

                    $couponcopy = '';
                    $couponflag = '';

                    if( isset($offer->coupon_available->coupon) && !empty($offer->coupon_available->coupon) && is_array($offer->coupon_available->coupon) )
                    {
                        $couponflag = '<span title="Click to show coupon!" onclick="jQuery(this).parent().parent().next().next().toggle();" style="cursor: pointer;">&#x2714;</span>';
                        $couponcopy = '<dl>';
                        foreach ( $offer->coupon_available->coupon as $coupon )
                        {
                            $couponcopy .= '<dt><div>' . ($coupon->desc_short) . '</div><div>' . (!empty($coupon->code) ? ('Use Code: ' . $coupon->code) : '') . '</div><div>' . ('Expires: ' . $coupon->expires) . '</div></dt>';
                        }
                        $couponcopy .= '</dl></div>';
                    }

                    $content .= <<<OFFERS
<tr>
    <td align="left"><img src="{$offer->merchant->image}" alt="{$offer->merchant->name}" title="{$offer->merchant->name}" /></td>
    <td align="center">{$conditioncopy} <span style="cursor: pointer;" onclick="jQuery(this).parent().parent().next().toggle();"><strong>&#10010;</strong></span></td>
    <td align="center"><img src="//images.campusbooks.com/campusbooks_legacy/images/icons/icon-{$offer->paymentType}.jpg" /></td>                  
    <td align="center">\${$offer->price}</td>
    <td align="center">{$couponflag}</td>
    <td align="center"><a target="_blank" href="{$offer->link}"><button>{$actioncopy}</button></a></td>
</tr>                    
<tr class="bookdetails" style="display: none;">
    <td>&nbsp;</td>
    <td colspan="6">{$bookinfocopy}</td>
</tr>
<tr class="bookcoupons" style="display: none;">
    <td>&nbsp;</td>
    <td colspan="6">{$couponcopy}</td>
</tr>
OFFERS;
                }
                $content .= '</table>';
            }

            return $content;
        }
        else
        {
            return '<p>Invalid ISBN or No results found for this book.</p>';
        }
    }

    function renderSearchResults($qs,$api_key)
    {
        $qs = sanitize_text_field($qs);

        $content = "<h2 class='view-title'>View results for " . $qs .  "</h2>";                        
        
        $api = new PriceNetworkAPIWrapper($api_key);

        $results = json_decode($api->searchKeywords($qs));
        
        $pcbuy_page = get_option('pricenetwork_pcbuy_page');
        $pcsell_page = get_option('pricenetwork_pcsell_page');
        $page_pcbuy = null;
        $page_pcsell = null;

        if( isset($pcbuy_page['page_id']) && !empty($pcbuy_page['page_id']) )
        {    
            $page_pcbuy = get_post($pcbuy_page['page_id']);
        }
        if( isset($pcsell_page['page_id']) && !empty($pcsell_page['page_id']) )
        {    
            $page_pcsell = get_post($pcsell_page['page_id']);
        }

        if ( isset($results->response->page->books->book) && is_array($results->response->page->books->book) && !empty($results->response->page->books->book) )
        {
            $books = $results->response->page->books->book;

            $content .= '<div class="grid-view">';

            foreach( $books as $book )
            {
                $booklinkbuy = isset($page_pcbuy->ID) ? (get_permalink($page_pcbuy->ID) . '?pncomparebook=buy&pnisbn=' . $book->isbn13) : '';
                $booklinksell = isset($page_pcsell->ID) ? (get_permalink($page_pcsell->ID) . '?pncomparebook=sell&pnisbn=' . $book->isbn13) : '';
                $row = <<<RROW


<div class="product-box">
<div class="image-box">
<a title="{$book->title}" href="{$booklinkbuy}">
<img alt="{$book->title}" src="{$book->image->image}" />
</a>
</div>
<div class="product-title">
<a title="Compare prices on {$book->title}" href="{$booklinkbuy}">{$book->title}</a>
</div>
<div class="product-description">
<p> <b>Author:</b> {$book->author}</p>
<p> <b>ISBN 10:</b> {$book->isbn10}</p>
<p> <b>ISBN 13:</b> {$book->isbn13}</p>
<p> <b>Edition:</b>{$book->edition}</p>
<p> <b>Binding:</b>{$book->binding}</p>
</div>
<div class="btn">
<div style="margin-bottom: 15px;">
<a href="{$booklinkbuy}"><button style="width: 100%" title="Compare Buy/Rent Prices on {$book->title}">Buy or Rent</button></a>
</div>
<div>
<a href="{$booklinksell}"><button style="width: 100%" title="Compare Sell Prices on {$book->title}">Sell</button></a>
</div>
</div>

</div>
RROW;
                $content .= $row;

            }

            $content .= '</div>';
            $content .= '<div class="ad4">
<iframe src="//rcm-na.amazon-adsystem.com/e/cm?o=1&p=48&l=ur1&category=books&banner=1E12T8MN3QGRR49EP802&f=ifr&linkID=94b274d19288143386fe23ffc74bb841&t=ergode1313-20&tracking_id=ergode1313-20" width="728" height="90" scrolling="no" border="0" marginwidth="0" style="border:none;" frameborder="0"></iframe>
</div>';
        }
        else
        {
            $content .= '<p>No results were found for your keywords.</p>';
        }

        return $content;
    }

    function register_settings()
    {
        register_setting( 'pnapisettings', 'pricenetwork_api_key' );
        register_setting( 'pnapisettings', 'pricenetwork_search_page' );
        register_setting( 'pnapisettings', 'pricenetwork_pcbuy_page' );
        register_setting( 'pnapisettings', 'pricenetwork_pcsell_page' );
    }

    function plugin_menu() 
    {
	    add_options_page( 'PriceNetwork Search Options', 'PriceNetwork Search', 'manage_options', 'pnapi-settings', array(&$this, 'admin_options') );
    }

    function admin_options() 
    {
	    if ( !current_user_can( 'manage_options' ) )  
        {
		    wp_die( __( 'You do not have sufficient permissions to access this page.' ) );
	    }

        ?>
            <div class="wrap">
                <h1>PriceNetwork Search Settings</h1>
                <form method="post" action="options.php"> 
                <?php settings_fields( 'pnapisettings' ); ?>
                <?php do_settings_sections( 'pnapisettings' ); ?>
                <?php $options_search = get_option( 'pricenetwork_search_page' ); ?>
                <?php $options_pcbuy = get_option( 'pricenetwork_pcbuy_page' ); ?>
                <?php $options_pcsell = get_option( 'pricenetwork_pcsell_page' ); ?>
                <table class="form-table">
                    <tr>
                        <th scope="row"><label for="pricenetwork_api_key">API Key</label></th>
                        <td><input type="text" id="pricenetwork_api_key" name="pricenetwork_api_key" value="<?php echo esc_attr( get_option('pricenetwork_api_key') ); ?>" /></td>
                    </tr>    
                    <tr>
                        <th scope="row"><label for="pricenetwork_search_page[page_id]">Page for Search Results</label></th>
                        <td>
                            <select id="pricenetwork_search_page[page_id]" name="pricenetwork_search_page[page_id]">
                                <option value=""></option>
                                <?php
                                    if( $pages = get_pages() )
                                    {
                                        foreach( $pages as $page )
                                        {
                                            echo '<option value="' . $page->ID . '" ' . selected( $page->ID, $options_search['page_id'] ) . '>' . $page->post_title . '</option>';
                                        }
                                    }
                                ?>
                            </select>
                        </td>
                    </tr>    
                    <tr>
                        <th scope="row"><label for="pricenetwork_pcbuy_page[page_id]">Page for Price Comparison Buy</label></th>
                        <td>
                            <select id="pricenetwork_pcbuy_page[page_id]" name="pricenetwork_pcbuy_page[page_id]">
                                <option value=""></option>
                                <?php
                                    if( $pages = get_pages() )
                                    {
                                        foreach( $pages as $page )
                                        {
                                            echo '<option value="' . $page->ID . '" ' . selected( $page->ID, $options_pcbuy['page_id'] ) . '>' . $page->post_title . '</option>';
                                        }
                                    }
                                ?>
                            </select>
                        </td>
                    </tr>    
                    <tr>
                        <th scope="row"><label for="pricenetwork_pcsell_page[page_id]">Page for Price Comparison Sell</label></th>
                        <td>
                            <select id="pricenetwork_pcsell_page[page_id]" name="pricenetwork_pcsell_page[page_id]">
                                <option value=""></option>
                                <?php
                                    if( $pages = get_pages() )
                                    {
                                        foreach( $pages as $page )
                                        {
                                            echo '<option value="' . $page->ID . '" ' . selected( $page->ID, $options_pcsell['page_id'] ) . '>' . $page->post_title . '</option>';
                                        }
                                    }
                                ?>
                            </select>
                        </td>
                    </tr>    
                </table>
                
                
                <?php submit_button(); ?>
                </form>
            </div>
        <?php
    }

    function book_results($posts) 
    {
        if(isset($_GET['pnqs']) && !empty($_GET['pnqs']))
        {
            return 'Hello';
        }

        return $posts;
    }
    
    function register_widgets()
    {
        global $wp_version;

        if (version_compare($wp_version, '2.8', '>=')) 
        {
            register_widget('PNSearchSidebarWidget');
        }
    }
}

$pnapiSearchObject = new PNAPISearch();
