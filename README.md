# devops-learn

## Sources
https://www.digitalocean.com/community/questions/api-adding-ssh-key-when-creating-a-droplet
https://www.digitalocean.com/community/tutorials/how-to-use-terraform-with-digitalocean
https://medium.com/redbubble/running-a-docker-container-as-a-non-root-user-7d2e00f8ee15

https://medium.com/@mitesh_shamra/terraform-provisioner-fa0911d65ce9

## Jenkins master installation

https://linuxize.com/post/how-to-install-jenkins-on-centos-7/

sudo yum install java-1.8.0-openjdk-devel -y
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo

sudo yum install jenkins -y
sudo systemctl start jenkins
systemctl status jenkins
sudo systemctl enable jenkins

assign devops-security-group to server

## Jenkins slave setup

sudo yum install java-1.8.0-openjdk-devel -y

## Change security level

<useSecurity>true</useSecurity>
sudo service jenkins restart

## Nexus setup

https://devopscube.com/how-to-install-latest-sonatype-nexus-3-on-linux/

sudo wget https://sonatype-download.global.ssl.fastly.net/repository/repositoryManager/3/nexus-3.16.1-02-unix.tar.gz

## Bitbucket setup

https://www.sbarjatiya.com/notes_wiki/index.php/CentOS_7.x_Install_Bitbucket

yum -y install git
sudo wget https://product-downloads.atlassian.com/software/stash/downloads/atlassian-bitbucket-6.3.0-x64.bin
sudo chmod a+x atlassian-bitbucket-4.12.0-x64.bin


