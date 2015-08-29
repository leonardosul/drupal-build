# Drupal Site Builder Script

This script builds a Drupal site. It takes one argument, and uses that argument as the site name, db name, db user and db password. This is designed so that you can quickly spin up a site for testing purposes, etc. You can edit the script to add your own customizations. See the <https://github.com/drush-ops/drush> documentation for available drush commands.

Prerequisites:

1. Have Drush installed on your development environment.
2. Have root access to MySQL.


To get started:

1. Clone the repo somewhere like www directory.
2. Run the script, passing in the site name.
3. If everything goes to plan you should have an installed drupal site, with database and admin user configured.
4. You will have to add a vhost configuration for your site in apache or nginx.

