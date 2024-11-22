FROM openjdk:11 AS BUILD_IMAGE
RUN apt update && apt install maven -y
RUN git clone https://github.com/akhileshLTIM/demoproject.git
RUN cd demoproject && git checkout master && mvn clean install

FROM tomcat:9-jre11
RUN rm -rf /usr/local/tomcat/webapps/*

COPY --from=BUILD_IMAGE demoproject/target/demoproject-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
