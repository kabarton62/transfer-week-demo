#!/bin/bash
#
# Set our variables
d="/usr/bin/sudo /usr/bin/docker"
c="/usr/bin/curl"
a="/usr/bin/sudo /usr/bin/apt"
#
# We are naming our Docker container "mutillidae", so first delete any containers with that name. 
# Also handy if we need to restore the container to it's original state.
#
$d stop mutillidae  && $d rm mutillidae
# Run citizenstig/nowasp and bind TCP 80 on the container to TCP 8080 on the instance.
$d run -d -p 8080:80 -p 3306:3306 --name mutillidae -e MYSQL_PASS="Chang3ME!" citizenstig/nowasp
$d ps
# Browse to gcp-instance:8080. You will be redirected to a page to install the database. Clink the link to install the db.
