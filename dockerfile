From tomcat:8.5.73-jdk17-openjdk-buster
add target/addressbook.war /usr/local/tomcat/webapps
expose 8080
cmd ["catalina.sh", "run"]
