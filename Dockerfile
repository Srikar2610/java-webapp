FROM tomcat:9-jdk11
COPY target/java-webapp.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
