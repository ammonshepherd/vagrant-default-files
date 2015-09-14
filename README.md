# Vagrant setup
  - Install vagrant
    - http://www.vagrantup.com/downloads.html
  - Install VirtualBox
    - https://www.virtualbox.org/wiki/Downloads
  - clone this repo into a new directory 
    - `git clone https://github.com/mossiso/vagrant-default-files myLamp`
  - run vagrant up (wait for thirty minutes or so while it sets up the virtual machine with lots of goodies)
    - `vagrant up`

# Log into Vagrant/VM
  - In the folder created above, 
    - `vagrant ssh`

# View Apps in local browser
  - For Rails apps, run them with the -b 0.0.0.0 flag
    - `bin/rails server -b 0.0.0.0`
    - Now you can view the app at http://localhost:3000
    - You can also use the IP address listed in the Vagrant file
      - http://192.168.33.83:3000
  - For Apache/PHP apps (runs on port 80)
    - view at http://localhost/

# Configuration settings
- Change IP address Vagrant uses
  - Edit the Vagrant file. Change the line listing the IP address
- /etc/host
  - You can give the VM a 'domain name' by changing the /etc/hosts file on your laptop
    - `sudo vim /etc/hosts`
    - Add a line at the bottom like this:
      - `192.168.33.83 myvmserver.dev`
    - Now you can view your app in a browser on your laptop by going to
      - http://myvmserver.dev

# Files
Following files are included to setup a Vagrant VM for use as a LAMP server.
  - .bash_profile
  - .tmux.conf
  - .vim/
  - .vimrc
  - .vimrc-root
  - README.md
  - Vagrantfile
  - lamp-setup.sh


