#!/bin/bash
git clone $1
mvn -f $(find * -name pom.xml) clean package
cp $(find / -type f -wholename "*target/*.war") /home/app/demo.war
java -jar demo.war
