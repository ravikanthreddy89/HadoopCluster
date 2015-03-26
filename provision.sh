#Stop the iptables
sudo service iptables stop

#Edit the hosts file
sudo echo "192.168.12.60 master" >> /etc/hosts
sudo echo "192.168.12.61 slave1" >> /etc/hosts
sudo echo "192.168.12.62 slave2" >> /etc/hosts
sudo echo "192.168.12.63 slave3" >> /etc/hosts

#Install java
cp /vagrant/jdk-7u75-linux-x64.tar.gz /home/vagrant
echo "Extracting java...."
tar -zxvf /home/vagrant/jdk-7u75-linux-x64.tar.gz
echo "export JAVA_HOME=/home/vagrant/jdk1.7.0_75" >> /home/vagrant/.bashrc
echo "export PATH=$PATH:$JAVA_HOME/bin" >> /home/vagrant/.bashrc
source /home/vagrant/.bashrc
echo "Installation of java successful."


#Install hadoop
echo "Installing hadoop...."
cp /vagrant/hadoop-*.tar.gz /home/vagrant
tar -zxvf /home/vagrant/hadoop-1.2.1-bin.tar.gz
echo "Successfully extracted hadoop."

  #hadoop configuration
  cd /home/vagrant/hadoop-1.2.1/conf
  #Configure core-site.xml, mapred-site.xml, hdfs-site.xml, hadoop-env.sh
  echo "Configuring hadoop."
  cat /vagrant/core-site.xml > core-site.xml
  echo "Configuration : core-site.xml complete."
  cat /vagrant/mapred-site.xml > mapred-site.xml
  echo "Configuration : mapred-site.xml complete."
  cat /vagrant/hdfs-site.xml > hdfs-site.xml
  echo "Configuration : hdfs-site.xml complete."
  #cat /vagrant/hadoop-env.sh > hadoop-env.sh
  cat /vagrant/masters > masters
  echo "Configuration : masters complete."
  cat /vagrant/slaves > slaves
  echo "Configuration : slaves complete."
   
  # create data directories for hadoop and set the permissions
  echo "Creating hadoop data directories."
  sudo mkdir /app/hadoop/tmp
  sudo chmod 750 /app/hadoop/tmp
  sudo chown vagrant /app/hadoop/tmp
  echo "Hadoop data directories created."
  # add hadoop bin the path
  echo "Adding hadoop bin to path variable."
  echo "export HADOOP_HOME=/home/vagrant/hadoop-1.2.1" >> /home/vagrant/.bashrc
  echo "export PATH=$PATH:$HADOOP_HOME/bin" >> /home/vagrant/.bashrc


