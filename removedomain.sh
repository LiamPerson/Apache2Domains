#!/bin/bash
echo What is the name of the website you want to remove\? \(e.g\: example.com\)
read v_website
echo -e "Website that will be removed is: $v_website \nIs this correct? [y/n]"
read -n 1 -r -s
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo -e "\nUnregistering domain from apache2 ...\n"
	a2dissite $v_website
	echo -e "Removing website config from apache2 sites-available directory ...\n"
	rm /etc/apache2/sites-available/$v_website.conf
	echo -e "Reloading apache2 ...\n"
	systemctl reload apache2
	echo -e "All configurations removed... All you have to do now is remove the files from /var/www/$v_website\n"
else
	echo -e "\nExiting...\n"
fi