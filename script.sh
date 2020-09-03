#!/bin/bash
git clone $1

mvn -f $(find * -name pom.xml) clean package

cp $(find / -type f -wholename "*target/*.jar") /home/app/demo.jar

java -jar demo.jar