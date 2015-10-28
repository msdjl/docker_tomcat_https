FROM tomcat
ADD entrypoint.sh /
EXPOSE 8443
CMD ["/entrypoint.sh"]
