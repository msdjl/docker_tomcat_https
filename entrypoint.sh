#!/bin/bash

# generate keystore
keytool -genkey -alias tomcat -keyalg RSA -keystore ${CATALINA_HOME}/.keystore -dname "CN=msdjl, OU=dev, O=org, C=RU" -storepass password -keypass password

# configure https
cat <<EOF > tmpsslconfig.tmp
<Connector port="8443" protocol="org.apache.coyote.http11.Http11NioProtocol"
maxThreads="150" SSLEnabled="true" scheme="https" secure="true"
keystoreFile=".keystore" keystorePass="password"
clientAuth="false" sslProtocol="TLS" />
EOF

sed -i '/<Service name="Catalina">/r tmpsslconfig.tmp' ${CATALINA_HOME}/conf/server.xml

# configure max allowed memory
echo "export JAVA_OPTS=\"-Xmx${CATALINA_MEMORY}\"" > ${CATALINA_HOME}/bin/setenv.sh

# copy additional apps from /webapps volume to ${CATALINA_HOME}/webapps
cp -r /webapps/* ${CATALINA_HOME}/webapps/

#placeholder#

# run tomcat
catalina.sh run
