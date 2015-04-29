# Docker image for Jenkins Operations Center

FROM apemberton/jenkins-base
MAINTAINER Andy Pemberton <apemberton@cloudbees.com>

# Download jenkins-oc.war
USER jenkins
WORKDIR /usr/lib/jenkins
RUN curl -L -O -w "Downloaded: %{url_effective}\\n" "http://nectar-downloads.cloudbees.com/jenkins-operations-center/1.580/war/1.580.13.1/jenkins-oc.war"

EXPOSE 8080 22
ENV JENKINS_HOME /var/lib/jenkins

ENTRYPOINT ["java", "-jar", "jenkins-oc.war", "--httpPort=8080"]
CMD ["--prefix=/operations-center"]

# CMD ["java", "-jar", "jenkins-oc.war", "--httpPort=8080", "--prefix=/operations-center"]