#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

JBOSS_HOME=/Users/dan/Desktop/master/javaTech/wildfly/wildfly-27.0.0.Final 

TOMCAT_WEBAPPS=/Library/Tomcat/webapps
JETTY_WEBAPPS=$JETTY_HOME/webapps
WILDFLY_WEBAPPS=$JBOSS_HOME/standalone/deployments
GLASSFISH_WEBAPPS=$GF_HOME/glassfish/domains/domain1/autodeploy
GLASS_FISH_BIN=/Users/dan/Desktop/master/javaTech/glassfish/glassfish5/bin

JETTY_HOME="/opt/homebrew/Cellar/jetty/9.4.49.v20220914/libexec/webapps"

print_green() {
    echo -e "${GREEN}" $1 "${NC}" 
}

print_red() {
    echo -e "${RED}" $1 "${NC}" 
}

print_red "Executing gradle clean build"
gradle clean build

print_green "Done building!"
print_red "Copying war archive to tomcat webapps ${TOMCAT_WEBAPPS}"
cp build/libs/servletFolder.war $TOMCAT_WEBAPPS
print_green "Copied!"

print_red "Copying war archive to jetty webapps ${JETTY_HOME}"
cp build/libs/servletFolder.war $JETTY_HOME
print_green "Copied!"

print_red "Copying war archive to wildfly deployments ${WILDFLY_WEBAPPS}"
cp build/libs/servletFolder.war $WILDFLY_WEBAPPS
print_green "Copied!"

print_red "Executing glassfish deploy at ${GLASS_FISH_BIN}/asadmin"
${GLASS_FISH_BIN}/asadmin deploy build/libs/servletFolder.war
print_green "Deployed!"

print_green "Done!"