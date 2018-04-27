FROM tomcat:8-jre8

# Define the environment variable APPENV to support TSF's env specific properties file read.
# Default value : DEV

# Clean the webapps directory. 
#The intention is to remove the default Contexts that includes Manager
RUN rm -r /usr/local/tomcat/webapps/*

# Deploy the application(war) into tomcat
ADD webapps/ /usr/local/tomcat/webapps/

# Add application specific settings.
# Tomcat allows us to provide certain options via setenv.sh that should reside under $CATALINA_HOME/bin
ADD bin/setenv.sh /usr/local/tomcat/bin/

# Expose 8080 Port.
# We would have Reverse Proxy configuration from Apache to Tomcat and hence would not require to expose the AJP port
EXPOSE 8080

# Start Tomcat and redirect all logs to stdout
CMD ["catalina.sh", "run"]
