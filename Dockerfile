FROM tomcat:8-jre8
ENV CATALINA_MEMORY="1G"
ADD entrypoint.sh ${CATALINA_HOME}/bin/
VOLUME ["/webapps"]
EXPOSE 8443
CMD ["entrypoint.sh"]
