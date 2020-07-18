Vagrant.configure("2") do |config|
	# Define services vm that will run our services within docker containers
	config.vm.define "services" do |services|
		services.vm.box = "ubuntu/trusty64"
		services.vm.box_url = "ubuntu/trusty64"
		services.vm.hostname = "services"
	end

	# Define nfs VM that will be our distant storage server
	config.vm.define "nfs" do |nfs|
		nfs.vm.box = "ubuntu/trusty64"
		nfs.vm.box_url = "ubuntu/trusty64"
		nfs.vm.hostname = "nfs"
		nfs.vm.network "forwarded_port", guest: 80, host: 8080
	end
end
