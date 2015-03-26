cp /vagrant/id_rsa.pub ~/.ssh/
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
sudo chmod +x ~/.ssh/authorized_keys
