Vagrant.configure(2) do |config|
    config.vm.box = "ubuntu/trusty64"
    config.vm.provider "virtualbox" do |v|
      v.memory = 2048
    end

    # files
    config.vm.synced_folder ".", "/data"

    # networking
    config.vm.network "private_network", ip: "192.168.10.50"
end
