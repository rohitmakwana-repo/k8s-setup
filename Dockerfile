FROM tomcat:latest
ADD ./target/k8sWebApp.war /usr/local/tomcat/webapps
EXPOSE 9090
CMD ["catalina.sh", "run"]