#!/bin/bash

run() {
	TOMCAT_WEBAPPS=/opt/tomcat/apache-tomcat-9.0.38/webapps
	git_url=$1
	if [ $2 == "build" ]; then
		echo Build current repository branch.
		build "$git_url" "$TOMCAT_WEBAPPS"
	elif [ $2 == "build_deploy" ]; then
		echo Build and deploy current repository branch.
		build "$git_url" "$TOMCAT_WEBAPPS"
		bash /opt/tomcat/apache-tomcat-9.0.38/bin/catalina.sh run
	elif [ $2 == "deploy_volume" ]; then
		echo Deploy the last artifact from volume.
		last_artifact=$(ls /my_volume/ -c | head -1)
		cp /my_volume/"$last_artifact" "$TOMCAT_WEBAPPS"
		bash /opt/tomcat/apache-tomcat-9.0.38/bin/catalina.sh run
	elif [ $2 == "deploy_branch" ]; then
		echo Deploy branch.
		build "$git_url" "$TOMCAT_WEBAPPS"
		build_branch $3
		bash /opt/tomcat/apache-tomcat-9.0.38/bin/catalina.sh run
	else
		echo You need to choose one of the options [build\|build_deploy\|deploy_volume\|deploy_branch \"your_branch\"].
	fi
}

build_branch() {
	rep_name=$(echo "$git_url" | awk -F/ '{print $NF}' | sed -e 's/.git$//');
	cd "$rep_name"
	git checkout $1
	mvn -f $(find * -name pom.xml) clean package
	cp $(find / -type f -wholename "*target/*.war") "$TOMCAT_WEBAPPS"/demo.war
}

build () {
	bash /home/app/script.sh $1
	ARTIFACT_WAR=/home/app/demo.war
	if [ -f "$ARTIFACT_WAR" ]; then
		echo The "$ARTIFACT_WAR" has extension \".war\".
		cp /home/app/demo.war $2
	else
		echo An error has occurred. The file must have the extension \".war\".
	fi
}

run $1 $2 $3