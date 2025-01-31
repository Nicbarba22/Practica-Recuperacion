#Este Vagrantfile configura una infraestructura de 3 capas utilizando VirtualBox y Vagrant. 
#Define las máquinas virtuales necesarias para cada capa de la arquitectura: balanceador de carga, servidores web, servidor NFS y base de datos. 
#Se asignan recursos de CPU y memoria adecuados para cada máquina,y se establecen redes privadas y públicas para simular el entorno de producción localmente.

Vagrant.configure("2") do |config|
  config.vm.box = "debian/bullseye64"

config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end


  # Capa 3: Base de Datos
  config.vm.define "ServerdatosNico" do |app|
    app.vm.hostname = "ServerdatosNico"
    app.vm.network "private_network", ip: "192.168.20.60", virtualbox__intnet: "cms2"
    #app.vm.provision "shell", path: "ServerdatosNico.sh"
  end

 # Capa 2: BackEnd - ServerNFS
 config.vm.define "ServernfsNico" do |app|
  app.vm.hostname = "ServernfsNico"
  app.vm.network "private_network", ip: "192.168.10.20", virtualbox__intnet: "cms1"
  app.vm.network "private_network", ip: "192.168.20.30", virtualbox__intnet: "cms2"
  #app.vm.provision "shell", path: "ServernfsNico.sh"
end

  # Capa 2: BackEnd - Web 1
  config.vm.define "Serverweb1Nico" do |app|
    app.vm.hostname = "Serverweb1Nico"
    app.vm.network "private_network", ip: "192.168.10.30", virtualbox__intnet: "cms1"
    app.vm.network "private_network", ip: "192.168.20.50", virtualbox__intnet: "cms2"
    #app.vm.provision "shell", path: "Serverweb1Nico.sh"
  end

  # Capa 2: BackEnd - Web 2
  config.vm.define "Serverweb2Nico" do |app|
    app.vm.hostname = "Serverweb2Nico"
    app.vm.network "private_network", ip: "192.168.10.31", virtualbox__intnet: "cms1"
    app.vm.network "private_network", ip: "192.168.20.51", virtualbox__intnet: "cms2"
    #app.vm.provision "shell", path: "Serverweb2Nico.sh"
  end

   # Capa 1: Balanceador
   config.vm.define "balanceadorNico" do |app|
    app.vm.hostname = "balanceadorNico"
    app.vm.network "public_network"
    app.vm.network "private_network", ip: "192.168.10.10", virtualbox__intnet: "cms1"
    app.vm.network "forwarded_port", guest: 80, host: 8080
    #app.vm.provision "shell", path: "balanceadorNico.sh"
  end


  config.ssh.insert_key = false
  config.ssh.forward_agent = false
end.
