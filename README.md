# Docker-Task

**BUILD DOCKER FOR HTTPS**

You should use the following commands to build the image

`docker build -t hordiy/springboot-git . `

**BUILD DOCKER FOR SSH**

You have to write down your private ssh key name instead of `id_rsa`:  
`MY_KEY=$(cat ~/.ssh/id_rsa`

`docker build --build-arg SSH_KEY="$MY_KEY" --build-arg HOST=git.epam.com -t hordiy/springboot-git . `

**RUN DOCKER FOR HTTPS**

The default variable for an artifact is `war`. if your project builds `jar`, `war` or etc. add this build option to the command

`docker run -d -i -p 8080:8080 hordiy/springboot-git https://github.com/hordiy/SpringBoot.git jar`

If you have private repository you can use the following ways

Create **Deploy Tokens**

1.  Go to the project (or group) you want to create Deploy Tokens for.
2.  Go to Settings > Repository.
3.  Click on “Expand” on Deploy Tokens section.
4.  Choose a name, expiry date (optional), and username (optional) for the token.
5.  Choose the desired scopes.
6.  Click on Create deploy token.

Thereafter, you can use this git link

`docker run -d -i -p 8080:8080 hordiy/springboot-git https://<username>:<deploy_token>@git.epam.com/Vladyslav_Hordiienko/springboot.git`

**RUN DOCKER FOR SSH**

If you've built docker for SSH

`docker run -d -i -p 8080:8080 hordiy/springboot-git git@git.epam.com:Vladyslav_Hordiienko/springboot.git`


**RESULT**

`docker exec -it {container_name} /bin/bash`

`curl localhost:8080/greeting?name=Docker` or run in browser http://192.168.99.100:8080/greeting?name=Docker

```
<!DOCTYPE HTML>
<html>
<head>
    <title>Getting Started: Serving Web Content</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
<p >Hello, Docker!</p>
</body>
```
