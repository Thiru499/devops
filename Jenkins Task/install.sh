# Update packages
sudo yum update -y

# Install Java (Jenkins requirement)
sudo amazon-linux-extras install java-openjdk11 -y

# Add Jenkins repo
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

# Install Jenkins
sudo yum install jenkins -y

# Start Jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Allow port 8080 in firewall
sudo firewall-cmd --permanent --add-port=8080/tcp
sudo firewall-cmd --reload

# Get admin password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
