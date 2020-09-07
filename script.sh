#!/bin/bash
git clone $1
package=war
artifact=${2:-$package}
mvn -f $(find * -name pom.xml) clean package
cp $(find / -type f -wholename "*target/*.$artifact") /home/app/demo.$artifact
java -jar demo.$artifact