FROM tomcat:latest
ADD ./target/k8sWebApp.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]
