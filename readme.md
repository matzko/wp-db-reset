WordPress Database Reset Shell Script
=====================================


What it Does
------------

Often when I'm developing a WordPress site, I need to restore the database to a previous state to repeat a test or fix a bug.  

For example, say I'm testing a user-registration process.
 * First, I'll dump the database to an sql file.
 * Then I run my tests, create the new user, etc.
 * To reset the database to the state before this action, I call the reset script:
  `./wp-db-reset.sh database-backup-file.sql`
 * NOTE: This must be done in a directory above the `wp-config.php` file.  E.g., in `/var/www/site/` if the path to `wp-config.php` is `/var/www/site/public_html/wp-config.php`

_THIS IS DANGEROUS TO USE ON A LIVE SITE_
Please use only in development and at your own risk!  You are losing all the contents of the first WP database this script finds in the directories below it.
