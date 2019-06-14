FROM anapsix/alpine-java:jdk8
ENV APP /

ENV TEAMSERVERURL=https://eval.contrastsecurity.com/Contrast/

## Contrast setup - set credentials.
## All environment variables could be
## * defined in kubernetes yaml file,
## * passed with docker run, etc.
## No need to define them in Dockerfile, but they need to be set.

# Can I just use my Org name?? rstatsinger is much easier to remember

ENVbu ORGID=77669368-0741-4f3d-80ad-26cdb7e14a99

ENV APIKEY=7XYyxPHNsvfyqyH03Pv780Bg3MpAxlaF
ENV SERVICEKEY=SGITUFBJB1BE03K7

ENV AUTHHEADER=cnN0YXRzaW5nZXJAZ21haWwuY29tOlNHSVRVRkJKQjFCRTAzSzc=

RUN apk update && apk add ca-certificates && update-ca-certificates && apk add openssl
RUN apk update; apk add curl

# RUN wget https://github.com/WebGoat/WebGoat/releases/download/7.1/webgoat-container-7.1-exec.jar

# RUN curl -X GET <Teamserver URL>/Contrast/api/ng/<OrganizationID> -H 'Authorization: <Authorization>' -H 'API-Key: <API KEY>' -o contrast.jar

RUN curl -X GET $TEAMSERVERURL/Contrast/api/ng/$ORGID -H 'Authorization: <$AUTHHEADER>' -H 'API-Key: <$APIKEY>' -o contrast.jar

WORKDIR $APP
EXPOSE 8080

CMD ["java","-javaagent:contrast.jar","-Dcontrast.override.appname=WebGoatDocker","-Dcontrast.server=DockerServer","-jar","webgoat-container-7.1-exec.jar"]
