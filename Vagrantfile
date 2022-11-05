# -*- mode: ruby -*-
# vi: set ft=ruby :

# Specify a custom Vagrant box for the demo
BOX_NAME = "ubuntu/jammy64"

# Vagrantfile API/syntax version.
# NB: Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

$pwdlessEntry= <<KEYGEN
sudo ssh-keygen -t rsa -f /home/ubuntu/.ssh/id_rsa -q -P ""
sudo ssh-copy-id ubuntu@master
sudo ssh-copy-id ubuntu@woker1
sudo ssh-copy-id ubuntu@woker2
KEYGEN

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = BOX_NAME
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = "2"
  config.hostsupdater.aliases = {
    '192.168.10.13' => ['ansible'],
    '192.168.10.14' => ['master'],
    '192.168.10.15' => ['worker1'],
    '192.168.10.16' => ['worker2']
  }
  end
  

  config.vm.define "master" do |master|
    master.vm.hostname = "master"
    master.vm.network "private_network", ip: "192.168.10.14"
    master.vm.provision "file", source: "./k8master", destination: "~/"
  end

  config.vm.define "worker1" do |worker1|
    worker1.vm.hostname = "worker1"
    worker1.vm.network "private_network", ip: "192.168.10.15"
  end
  
  config.vm.define "worker2" do |worker2|
    worker2.vm.hostname = "worker2"
    worker2.vm.network "private_network", ip: "192.168.10.16"
  end

  config.vm.define "ansible" do |ansible|
    ansible.vm.hostname = "ansible"
    ansible.vm.network "private_network", ip: "192.168.10.13"
    ansible.vm.provision "file", source: "./ansible", destination: "~/"
    ansible.hostsupdater.aliases = {
    '192.168.10.13' => ['ansible'],
    '192.168.10.14' => ['master'],
    '192.168.10.15' => ['worker1'],
    '192.168.10.16' => ['worker2']
    }
    ansible.vm.provision "shell", inline: $pwdlessEntry
  end
  
end
