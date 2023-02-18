#!/bin/bash
#Author: Angelina
#Date: Jan 2023
#Description: Installation of jenkins on new linux machine    

#######################################################       
  sudo yum install wget -y
  sudo yum install net-tools -y

###################################################
  sudo yum install firewalld -y
  sudo systemctl enable firewalld
  sudo systemctl start firewalld
  sudo susytemctl status firewalld

#####################################################
  sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat/jenkins.repo
  sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
  sudo yum upgrade

####################################################
  sudo yum install java-11-openjdk -y
  sudo yum install jenkins -y

#####################################################
  sudo systemctl enable jenkins
  sudo systemctl start jenkins
  sudo systemctl status jenkins

####################################################
  sudo firewall-cmd --add-service=jenkins --permanent
  sudo firewall-cmd --add-port=8080/tcp --permanent
  sudo firewall-cmd --reload
[root@practice_box script]# ls
dallas.sh  jenkins_auto.sh  package.sh  server_inven.sh       
excel      jenkins.sh       pkg.sh      success
file.sh    Naomi            read1.sh
ike.sh     nohup.out        read.sh
[root@practice_box script]# cat jenkins_auto.sh 
#!/bin/bash
#Author:Angelina
#Date:Jan 2023
#Description: Jenkins automation script

############################################################  
echo "Getting the jenkins package package into our repo..."   
sleep 3
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
sudo yum upgrade
echo
############################################################# 
echo "installing jenkins and dependencies..."
sleep 3
sudo yum install java-11-openjdk -y
sudo yum install jenkins -y
echo
############################################################# 
echo "starting jenkins..."
sleep 3
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
echo
##############################################################
echo "installing and setting firewalld..."
sleep 3
sudo yum install firewalld -y
sudo systemctl enable firewalld
sudo systemctl start firewalld
sudo systemctl status firewalld
echo
############################################################# 
echo "adding jenkins to firewalld..."
sleep 3
sudo firewall-cmd --permanent --add-service=jenkins
sudo firewall-cmd --permanent --add-port=8080/tcp
sudo firewall-cmd --reload
echo
############################################################# 
echo "getting administrator password..."
sleep 3
sudo cat /var/lib/jenkins/secrets/initialAdminPassword        
echo
##############################################################