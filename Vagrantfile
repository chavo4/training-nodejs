Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = "chavo"
  config.vm.network "private_network", ip: "192.168.56.56"
  config.vm.provision "shell", path: "docker.sh"
end
