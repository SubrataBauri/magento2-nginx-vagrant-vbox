
Vagrant.configure(2) do |config|

unless Vagrant.has_plugin?("vagrant-vbguest")
  raise 'vagrant-vbguest plugin is not installed!  Please run the following command: vagrant plugin install vagrant-vbguest'
end

#unless Vagrant.has_plugin?("vagrant-disksize")
#  raise 'vagrant-disksize plugin is not installed!  Please run the following command: vagrant plugin install vagrant-disksize'
#end

  # Specify the base box
  #config.vm.box_download_insecure = true
  config.vm.box = "ubuntu/bionic64"
  #config.disksize.size = "30GB"

  # Setup port forwarding
  #config.vm.network "forwarded_port", guest: 22, host: 1022, host_ip: "127.0.0.1", id: 'ssh'

  # Setup network
  config.vm.network "private_network", ip: "10.0.0.103"
  config.vm.hostname = "dev.magento2.com"

  # Setup synced folder
    config.vm.synced_folder "magento2/", "/var/www/html", group: "www-data", owner: "vagrant", :mount_options => ['dmode=775', 'fmode=775']

  # CUSTOMIZATION
   config.vm.provider "virtualbox" do |vb|

     vb.name = "dev.magento2.com"
     #vb.gui = true
  
     # Customize the amount of memory on the VM:
     vb.memory = "2048"
     vb.cpus = 2
   end


  # PROVISION
  # config.vm.provision :shell, path: “vagrant/bootstrap.sh"
   # Shell provisioning
    # config.vm.provision "shell" do |s|
    #   s.path = "vagrant/bootstrap.sh"
    # end
  
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
end
