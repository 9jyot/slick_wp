<?php
/**
 * The template for displaying the footer
 *
 * Contains the closing of the #content div and all content after.
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package WordPress
 * @subpackage Twenty_Seventeen
 * @since 1.0
 * @version 1.2
 */

?>

		</div><!-- #content -->

		<footer id="colophon" class="site-footer" role="contentinfo">
			<div class="wrap">
				<?php
				get_template_part( 'template-parts/footer/footer', 'widgets' );

				if ( has_nav_menu( 'social' ) ) : ?>
					<nav class="social-navigation" role="navigation" aria-label="<?php esc_attr_e( 'Footer Social Links Menu', 'twentyseventeen' ); ?>">
						<?php
							wp_nav_menu( array(
								'theme_location' => 'social',
								'menu_class'     => 'social-links-menu',
								'depth'          => 1,
								'link_before'    => '<span class="screen-reader-text">',
								'link_after'     => '</span>' . twentyseventeen_get_svg( array( 'icon' => 'chain' ) ),
							) );
						?>
					</nav><!-- .social-navigation -->
				<?php endif;

				//get_template_part( 'template-parts/footer/site', 'info' );
				?>
				<i>Copyright @ 2017 by <b><span class='site-txt'>Slick</span>purchase</b>
				Design and Developed by <b><span class='site-txt'>Slick</span>purchase</b>
				<p>Slick purchase is an advanced online book search engine
that enables you to search for the books at cheap price.</p></i>
			</div><!-- .wrap -->
		</footer><!-- #colophon -->
	</div><!-- .site-content-contain -->
</div><!-- #page -->
<?php wp_footer(); ?>

</body>
<script>

//search book script
	function search_book() {

		jQuery.ajax({
		    url: 'wp-content/plugins/custom_captcha/check_ip.php',
		    type: "POST",
		    success: function(response){

				console.log(response);
				
				var obj = jQuery.parseJSON(response)
				//if(response.status)
				//console.log(obj.status);
				//return false;
				if(obj.status == "allowed")
				{					
					jQuery("#pnsearchform").submit();
				}else{
					jQuery(".captcha-div").attr("style", "");					
					var search_book_call=1;
					check_captcha(search_book_call);
				}

		    },
		    error: function(data){
		      //alert("error!");
		      console.log("network error "+data )
		    }
		});

		
		
	}

	function check_captcha(call_ref)
	{
		jQuery.ajax({
		    url: 'wp-content/plugins/custom_captcha/check_captcha.php',
		    data:{
		    	captcha_entered : jQuery("#captcha_entered").val()
		    },
		    type: "POST",
		    success: function(response){
				//console.log(response);
				var obj = jQuery.parseJSON(response)
				//if(response.status)
				//console.log(obj.status);
				//return false;
				jQuery("#captcha_entered").val();
				if(obj.msg == "Match")
				{

					jQuery(".captcha-div").attr("style", "");					
					jQuery("#pnsearchform").submit();
				}else{
					if(call_ref!=1)
					{
						alert("Please input right answer");
					}
					//jQuery(".captcha-div").attr("style", "");
					//check_captcha();

				}

		    },
		    error: function(data){
		      //alert("error!");
		      console.log("Network error"+data);
		    }
		});

	}
</script>
</html>
