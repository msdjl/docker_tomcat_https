FROM tomcat
ENV CATALINA_MEMORY="1G"
ADD entrypoint.sh .
EXPOSE 8443
CMD ["entrypoint.sh"]
