#!/bin/bash
echo What is the website domain\? \(e.g\: example.com\)
read v_website
echo -e "Website name will be: $v_website \nIs this correct? [y/n]"
read -n 1 -r -s
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo -e "\nCreating new directory in /var/www ...\n"
	mkdir /var/www/$v_website
	echo -e "Changing ownership in new directory ...\n"
	chown -R $USER:$USER /var/www/$v_website
	set -o noclobber
	echo -e "Writing config file to /etc/apache2/sites-available/$v_website.conf ...\n"
	printf "<VirtualHost *:80>
    ServerName $v_website
    ServerAlias www.$v_website
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/$v_website
    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>" $USER > /etc/apache2/sites-available/$v_website.conf
	echo -e "Changing ownership of config file...\n"
	chown -R $USER:$USER /etc/apache2/sites-available/$v_website.conf
	echo -e "Adding website to a2ensite...\n"
	a2ensite $v_website
	echo -e "Reloading apache2 ... \n"
	systemctl reload apache2
	echo -e "Finished registering website!\n"
else
	echo -e "\nExiting...\n"
fi