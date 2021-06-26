#!/bin/bash
echo What is the website domain\? \(e.g\: example.com\)
read v_website
echo -e "Website name will be: $v_website \nIs this correct? [y/n]"
read -n 1 -r -s
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo -e "\nCreating new directory in /var/www ...\n"
	mkdir /var/www/$v_website
	echo -e "Changing ownership in new directory to ${SUDO_USER:-${USER}} ...\n"
	chown -R ${SUDO_USER:-${USER}}:${SUDO_USER:-${USER}} /var/www/$v_website
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
	echo -e "Changing ownership of config file to ${SUDO_USER:-${USER}} ...\n"
	chown -R ${SUDO_USER:-${USER}}:${SUDO_USER:-${USER}} /etc/apache2/sites-available/$v_website.conf
	echo -e "Adding website to a2ensite ...\n"
	a2ensite $v_website
	echo -e "Reloading apache2 ... \n"
	systemctl reload apache2
	echo -e "Finished registering website!\n"
	echo -e "\nDo you want to initiate a blank index.html file in the website directory? [y/n]"
	read -n 1 -r -s
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		echo -e "Creating new index.html file in /var/www/$v_website ...\n"
		printf "<!DOCTYPE html>
			<html>
			<head>
				<title>$v_website | Under construction...</title>
			</head>
			<body>
				<h1>Welcome to $v_website</h1>
				<p>This website is currently under construction...</p>
			</body>
			</html>" $USER > /var/www/$v_website/index.html
		echo -e "Changing ownership of index.html to ${SUDO_USER:-${USER}} ..."
		chown -R ${SUDO_USER:-${USER}}:${SUDO_USER:-${USER}} /var/www/$v_website/index.html
		echo -e "All processes complete!\nExiting...\n"
	else
		echo -e "\nExiting...\n"
	fi
else
	echo -e "\nExiting...\n"
fi