#!/usr/bin/env bash
# Drupal build script.
# Build a new site quickly from the command line.

# Database connection details, you will have to add your own in here.
dbhost="localhost"
dbuser="root"
dbpass="root"

# Drupal super user account details, you can edit these as you like.
account_name="admin"
account_pass="admin"
account_mail="admin@example.com"

# First and only parameter.
answer=$1

echo "Starting Drupal Build"

if [ $# -eq 0 ]
  then
    echo "Please enter a name for this site: "
    read answer
    if [ ! -z "$answer" ]
    then
      echo "Thank You, continuing build..."
    else
      echo "No data supplied, exiting"
    fi
fi


# Make a database, we will use the website name as the db name
echo "Creating database $answer (if it's not already there)"
mysql -u $dbuser --password=$dbpass -e "CREATE DATABASE IF NOT EXISTS $answer"
mysql -u $dbuser --password=$dbpass -e "CREATE USER '$answer'@'localhost' IDENTIFIED BY '$answer'"
mysql -u $dbuser --password=$dbpass -e "GRANT ALL PRIVILEGES ON $answer.* TO $answer@localhost IDENTIFIED BY '$answer';"

# Download Drupal to a directory named after our site.
if [ ! -d $answer ]
  then
	echo "Installing Drupal using Drush"
	drush dl drupal --drupal-project-rename=$answer
	cd $answer
	drush site-install --db-url=mysql://$answer:$answer@localhost/$answer \
	--account-name=$account_name \
	--account-pass=$account_pass \
	--account-mail=$account_mail \
	--site-name=$answer
fi

echo "Drupal site built and ready!";
