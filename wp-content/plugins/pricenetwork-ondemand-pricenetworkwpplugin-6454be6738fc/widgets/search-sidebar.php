<?php

/**
 * PNSearchSidebarWidget
 */
class PNSearchSidebarWidget extends WP_Widget
{
    function  PNSearchSidebarWidget()
    {
        $widget_ops = array(
            'classname' => 'PNSearchSidebarWidget',
            'description' => 'PriceNetwork search sidebar',
        );

        $this->WP_Widget('PNSearchSidebarWidget', 'PriceNetwork search sidebar',
                $widget_ops);
    }

    function widget($args, $instance)
    {
        $search_page = get_option('pricenetwork_search_page');
        $page = null;

        if( isset($search_page['page_id']) && !empty($search_page['page_id']) )
        {    
            $page = get_post($search_page['page_id']);
        }
        
        extract( $args );

        $title = apply_filters('widget_title', $instance['title']);

        echo $before_widget;

        if ( $title ) 
        {
            echo $before_title . $title . $after_title;
        }

        if ( $page ) 
        {
            ?>
                <form id="pnsearchform" method="get" action="<?php echo get_permalink($page->ID); ?>">
                <input style="width: 100%;" type="text" name="pnqs" id="pnqs" value="" placeholder="<?php _e('Search here to BUY, RENT and SELL textbooks'); ?>" />
                    <input type="submit" value="<?php _e('Search'); ?>" />
                </form>
            <?php
        }
        else
        {
            echo "Select the search results page in the plugin options.";
        }
            
        echo $after_widget;
    }

    function update($new_instance, $old_instance) 
    {
	    $instance = $old_instance;
        
        $instance['title'] = strip_tags($new_instance['title']);

        return $instance;
    }

    function form($instance) 
    {
        $title = !empty($instance['title']) ? esc_attr($instance['title']) : '';

        ?>
            <p><label for="<?php echo $this->get_field_id('title'); ?>">
            <?php _e('Title:'); ?>
            <input class="widefat" id="<?php echo $this->get_field_id('title'); ?>"
                   name="<?php echo $this->get_field_name('title'); ?>"
                   type="text" value="<?php echo $title; ?>" />
            </label></p>
        <?php
    }
}


