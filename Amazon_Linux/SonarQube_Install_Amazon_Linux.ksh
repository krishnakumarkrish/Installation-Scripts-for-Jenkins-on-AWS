sudo yum install java-17-amazon-corretto-devel -y

cd /opt

sudo yum install wget unzip -y

sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.9.10.61524.zip

sudo unzip sonarqube-8.9.10.61524.zip

sudo useradd sonar

sudo chown -R sonar:sonar /opt/sonarqube-8.9.10.61524

sudo chmod -R 775 /opt/sonarqube-8.9.10.61524	

sudo -u sonar /opt/sonarqube-8.9.10.61524/bin/linux-x86-64/sonar.sh start

sudo -u sonar /opt/sonarqube-8.9.10.61524/bin/linux-x86-64/sonar.sh status
