# Docker image for Jenkins Operations Center

FROM kmadel/jenkins-base
MAINTAINER Kurt Madel <kmadel@cloudbees.com>

# Download jenkins-oc.war
USER jenkins
WORKDIR /usr/lib/jenkins
RUN curl -L -O -w "Downloaded: %{url_effective}\\n" "http://nectar-downloads.cloudbees.com/cjoc/1.609/war-rc/1.609.1.1/jenkins-oc.war"

EXPOSE 8080 22 4001
ENV JENKINS_HOME /var/lib/jenkins

ENTRYPOINT ["java", "-jar", "jenkins-oc.war", "--httpPort=8080"]
CMD ["--prefix=/operations-center"]