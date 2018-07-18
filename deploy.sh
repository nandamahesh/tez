#bin/bash

ENVIRONMENT=$1

if [ $ENVIRONMENT = "QA" ];then

     for i in `cat IPs.txt`
     do
      
     echo "Deploying war file into $i QA Servers.."
     
     sleep 5
     
     sshpass -p "weblogic@123" scp -rp /home/ubuntu/dummy/target/*.jar mahesh@13.126.144.36:/home/mahesh/apache-tomcat-8.5.32/webapps

     echo "Starting tomcat Server in $i QA Servers.."

     sshpass -p "weblogic@123" ssh mahesh@$i "JAVA_HOME=/home/mahesh/jdk1.8.0_171" "/home/mahesh/apache-tomcat-8.5.32/bin/startup.sh"

     done

     echo "Deployment is successfully...."

fi

     
