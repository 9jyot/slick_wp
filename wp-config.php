<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'slick');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', '');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'Mh+<)[ZM!p?cqCR?.ycY`&ArS}e~ _!&9Ja+FCg^37ZG)!`CustBK4S3U[G:|?|&');
define('SECURE_AUTH_KEY',  'G)^39x_O]d8qn~Eg-cYV_`]z_O#KH>H<^P{6VC%WnBsS8,G6#k~zaEFes[cO;!ot');
define('LOGGED_IN_KEY',    'Ar<w#I0W mcm|Nu%TFCMS}S!f5?1UW5i$;JqMZ/?:<,]16.`FAr!7:@u;.@qKUmI');
define('NONCE_KEY',        '3|]c(]d+DuuSxv4Nhx+h@coKf*.W8}qs$A2K7#Y,;r#z=aG.vQf%P.:FD9~55.uV');
define('AUTH_SALT',        '+x4Vo9Qp3x4R`Q%A=M&m6[|/MN<#!$a}vqm)^U]XYAFJmRJkR+A=D0B^[z%z(|Ue');
define('SECURE_AUTH_SALT', 'J7m:f6pFA|y.6;6^J@t&d2f&7!0Jy/q$#WcqsP1/iaVUss>po5q0j^9JJn7IkK4u');
define('LOGGED_IN_SALT',   '$d!jQuLd0vVCSgesgtlV7:,<.odoaG)YSWm]Gjs)dIy )JVJR-(,*4=K-qPi+44N');
define('NONCE_SALT',       'q5iVwh#=!+H;ZdyeVxX2)Qo9h7K;Tf[meZpW4Ad:>O26]#eISea_/r[FAT/&WJYP');
define('FS_METHOD',		   'direct');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
