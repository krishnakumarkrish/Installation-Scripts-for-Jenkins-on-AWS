#!/bin/bash
#!/usr/bin/ksh

#-----------------------------------
# Jenkins on AWS
# Jenkins_Install.ksh
# https://www.jenkins.io/doc/tutorials/tutorial-for-installing-jenkins-on-AWS/
# /var/lib/jenkins/secrets/initialAdminPassword
# /tmp/jenkins_install_${PID}.txt - Logs
# Author: Krishna Kumar M - https://github.com/krishnakumarkrish
# Version: 1.1
#-----------------------------------

set -e  # Exit immediately if any command fails

PID=$$

# Remove previous logs if they exist
rm -f /tmp/jenkins_install_*

# Create a new log file
tmp_jenkins_install="/tmp/jenkins_install_${PID}.txt"

echo "**********************************************************************"  | tee -a $tmp_jenkins_install
echo "Ensure that your software packages are up to date on your instance"  | tee -a $tmp_jenkins_install
echo "**********************************************************************"  | tee -a $tmp_jenkins_install 
sudo yum update -y | tee -a $tmp_jenkins_install

echo "**********************************************************************"  | tee -a $tmp_jenkins_install
echo "Add the Jenkins repo"  | tee -a $tmp_jenkins_install
echo "**********************************************************************"  | tee -a $tmp_jenkins_install
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo 2>&1 | tee -a $tmp_jenkins_install

echo "**********************************************************************"  | tee -a $tmp_jenkins_install
echo "Import a key file from Jenkins-CI to enable installation from the package"  | tee -a $tmp_jenkins_install
echo "**********************************************************************"  | tee -a $tmp_jenkins_install		
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key 2>&1 | tee -a $tmp_jenkins_install

# Upgrade all installed packages
sudo yum upgrade -y | tee -a $tmp_jenkins_install

echo "**********************************************************************"  | tee -a $tmp_jenkins_install
echo "Install Java (Amazon Linux 2023)"  | tee -a $tmp_jenkins_install
echo "**********************************************************************"  | tee -a $tmp_jenkins_install
sudo dnf install java-17-amazon-corretto -y | tee -a $tmp_jenkins_install

echo "**********************************************************************"  | tee -a $tmp_jenkins_install
echo "Install Jenkins"  | tee -a $tmp_jenkins_install
echo "**********************************************************************"  | tee -a $tmp_jenkins_install
sudo yum install jenkins -y | tee -a $tmp_jenkins_install

echo "**********************************************************************"  | tee -a $tmp_jenkins_install
echo "Enable the Jenkins service to start at boot"  | tee -a $tmp_jenkins_install
echo "**********************************************************************"  | tee -a $tmp_jenkins_install
sudo systemctl enable jenkins | tee -a $tmp_jenkins_install

echo "**********************************************************************"  | tee -a $tmp_jenkins_install
echo "Start Jenkins as a service"  | tee -a $tmp_jenkins_install
echo "**********************************************************************"  | tee -a $tmp_jenkins_install
sudo systemctl start jenkins | tee -a $tmp_jenkins_install

echo "**********************************************************************"  | tee -a $tmp_jenkins_install
echo "Check the status of the Jenkins service"  | tee -a $tmp_jenkins_install
echo "**********************************************************************"  | tee -a $tmp_jenkins_install
sudo systemctl status jenkins | tee -a $tmp_jenkins_install

echo "**********************************************************************"  | tee -a $tmp_jenkins_install
echo "Completed"  | tee -a $tmp_jenkins_install
echo "**********************************************************************"  | tee -a $tmp_jenkins_install

