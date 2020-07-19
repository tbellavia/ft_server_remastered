Vagrant.configure("2") do |config|
	# Define nfs VM that will be our distant storage server
	# configure this VM first because the other server need the NFS
	# to connect to it.
	config.vm.define "nfs" do |nfs|
		nfs.vm.box = "ubuntu/trusty64"
		nfs.vm.box_url = "ubuntu/trusty64"
		nfs.vm.hostname = "nfs"
		nfs.vm.network "forwarded_port", guest: 80, host: 8080
		nfs.vm.network "private_network", ip: "10.0.0.11", bridge: "en1: Wi-Fi (AirPort)"
		nfs.vm.provision "shell", path: "config/nfs-setup.sh"
	end

	# Define services vm that will run our services within docker containers
	config.vm.define "services" do |services|
		services.vm.box = "ubuntu/trusty64"
		services.vm.box_url = "ubuntu/trusty64"
		services.vm.hostname = "services"
		services.vm.network "private_network", ip: "10.0.0.10", bridge: "en1: Wi-Fi (AirPort)"
		services.vm.provision "shell", path: "config/services-setup.sh"
	end
	
end
