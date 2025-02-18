#-----------------------------------

#   Jenkins on AWS
#   Jenkins_Install.ksh
#   https://www.jenkins.io/doc/tutorials/tutorial-for-installing-jenkins-on-AWS/
#   /var/lib/jenkins/secrets/initialAdminPassword
#   /tmp/jenkins_install_${PID}.txt - Logs
#   Authour : Krishna Kumar M - https://github.com/krishnakumarkrish
#   version : 1.1

#-----------------------------------

PID=$$

rm -f /tmp/jenkins_install_*
tmp_jenkins_install=/tmp/jenkins_install_${PID}.txt

echo "**********************************************************************"  >>$tmp_jenkins_install
echo "Ensure that your software packages are up to date on your instance to perform a quick software update"  >>$tmp_jenkins_install
echo "**********************************************************************"  >>$tmp_jenkins_install 
sudo yum update >>$tmp_jenkins_install


echo "**********************************************************************"  >>$tmp_jenkins_install
echo "Add the Jenkins repo"  >>$tmp_jenkins_install
echo "**********************************************************************"  >>$tmp_jenkins_install
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo >>$tmp_jenkins_install


echo "**********************************************************************"  >>$tmp_jenkins_install
echo "Import a key file from Jenkins-CI to enable installation from the package"  >>$tmp_jenkins_install
echo "**********************************************************************"  >>$tmp_jenkins_install		
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key >>$tmp_jenkins_install

sudo yum upgrade >>$tmp_jenkins_install


echo "**********************************************************************"  >>$tmp_jenkins_install
echo "Install Java (Amazon Linux 2023)"  >>$tmp_jenkins_install
echo "**********************************************************************"  >>$tmp_jenkins_install
sudo dnf install java-17-amazon-corretto -y >>$tmp_jenkins_install

echo "**********************************************************************"  >>$tmp_jenkins_install
echo "Install Jenkins"  >>$tmp_jenkins_install
echo "**********************************************************************"  >>$tmp_jenkins_install
sudo yum install jenkins -y >>$tmp_jenkins_install


echo "**********************************************************************"  >>$tmp_jenkins_install
echo "Enable the Jenkins service to start at boot"  >>$tmp_jenkins_install
echo "**********************************************************************"  >>$tmp_jenkins_install
sudo systemctl enable jenkins >>$tmp_jenkins_install


echo "**********************************************************************"  >>$tmp_jenkins_install
echo "Start Jenkins as a service"  >>$tmp_jenkins_install
echo "**********************************************************************"  >>$tmp_jenkins_install
sudo systemctl start jenkins >>$tmp_jenkins_install


echo "**********************************************************************"  >>$tmp_jenkins_install
echo "Check the status of the Jenkins service"  >>$tmp_jenkins_install
echo "**********************************************************************"  >>$tmp_jenkins_install
sudo systemctl status jenkins >>$tmp_jenkins_install


echo "**********************************************************************"  >>$tmp_jenkins_install
echo " Completed "  >>$tmp_jenkins_install
echo "**********************************************************************"  >>$tmp_jenkins_install
