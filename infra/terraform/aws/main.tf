module "vpc" {
  source            = "./modules/vpc"
}
module "ec2" {
  source = "./modules/ec2"

  name            = "jenkins-server"
  instance_type = "t3.small"
  key_pair        = "devops-learn"
  security_groups = [
    "${module.vpc.allow_ssh}",
    "${module.vpc.allow_outbound}"
  ]
}

module "ec2-slave" {
  source = "./modules/ec2"
  servers = 2

  name            = "jenkins-slave"
  key_pair        = "devops-learn"
  security_groups = [
    "${module.vpc.allow_ssh}",
    "${module.vpc.allow_outbound}"
  ]
}

module "nexus" {
  source = "./modules/ec2"

  name            = "nexus-server"
  instance_type = "t3.small"
  key_pair        = "devops-learn"
  security_groups = [
    "${module.vpc.allow_ssh}",
    "${module.vpc.allow_outbound}"
  ]
}

resource "null_resource" "jenkins" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers = {
    cluster_instance_ids = "${module.ec2.server-id[count.index]}"
  }

  # Bootstrap script can run on any instance of the cluster
  # So we just choose the first in this case
  connection {
    host = "${module.ec2.server-ip}"
    type     = "ssh"
    user     = "ec2-user"
    password = ""
    private_key = "${file("~/.ssh/devops-learn.pem")}"
  }

  provisioner "remote-exec" {
    # Bootstrap script called with private_ip of each node in the cluster
    inline = [
      "sudo yum install java-1.8.0-openjdk-devel -y",
      "sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key",
      "curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo",
      "sudo yum install jenkins -y",
      "sudo systemctl start jenkins",
      "systemctl status jenkins",
      "sudo systemctl enable jenkins"
    ]
  }
}

resource "null_resource" "nexus" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers = {
    cluster_instance_ids = "${module.nexus.server-id[count.index]}"
  }

  # Bootstrap script can run on any instance of the cluster
  # So we just choose the first in this case
  connection {
    host = "${module.ec2.server-ip}"
    type     = "ssh"
    user     = "ec2-user"
    password = ""
    private_key = "${file("~/.ssh/devops-learn.pem")}"
  }

  provisioner "remote-exec" {
    # Bootstrap script called with private_ip of each node in the cluster
    inline = [
      "sudo yum install java-1.8.0-openjdk-devel -y",
      "sudo wget https://sonatype-download.global.ssl.fastly.net/repository/repositoryManager/3/nexus-3.16.1-02-unix.tar.gz",
      "sudo tar -xvf nexus-3.16.1-02-unix.tar.gz",
      "sudo mv nexus-3.16.1-02 nexus",
    ]
  }
}
