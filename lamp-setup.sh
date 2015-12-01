################################################################################
# RepoForge Yum Packages
# Check here for latest version: http://repoforge.org/use/
cd ~/
wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
rpm -UVh rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm



################################################################################
# Run Yum Update
yum -y update
yum install -y epel-release pygpgme curl curl-devel dkms gcc gettext git httpd httpd-devel ImageMagick man mysql mysql-devel mysql-libs mysql-server ncurses ncurses-devel php php-devel php-mysql sqlite-devel tmux unzip zip kernel-devel-$(uname -r) kernel-headers-$(uname -r)



################################################################################
# Start Apache HTTPD and MySQL services
service httpd start
chkconfig httpd on
service mysqld start
chkconfig mysqld on



################################################################################
# Copy user dot files
cp /vagrant/.bash_profile /home/vagrant/
cp -r /vagrant/vim /home/vagrant/.vim
ln -s /home/vagrant/.vim/.vimrc /home/vagrant/.vimrc
cp /vagrant/.vimrc-root /root/.vimrc
cp /vagrant/.tmux.conf /home/vagrant/
# fix perms
chown -R vagrant:vagrant /home/vagrant/


################################################################################
### Upgrade git
yum -y install zlib-devel perl-ExtUtils-MakeMaker asciidoc xmlto openssl-devel
cd ~/
git clone git://github.com/git/git
cd git
make configure
./configure --prefix=/usr/local
make all doc
make install install-doc install-html


################################################################################
# ViM
### Install latest version of VIM
# Check here for latest version: ftp://ftp.vim.org/pub/vim/unix
cd /usr/local/src/
git clone https://github.com/vim/vim.git
cd vim/src
./configure --prefix=/usr --with-features=huge --enable-rubyinterp --enable-pythoninterp
make && make install
git clone https://github.com/VundleVim/Vundle.vim.git /home/vagrant/.vim/bundle/Vundle.vim




################################################################################
# Tmux
# Install latest version of tmux
# Check for latest version at: http://sourceforge.net/projects/levent/files/libevent/
# cd ~/
# wget http://iweb.dl.sourceforge.net/project/levent/libevent/libevent-2.0/libevent-2.0.22-stable.tar.gz
# tar -xvzf libevent-2.0.22-stable.tar.gz
# cd libevent-2.0.22-stable
# ./configure
# make
# make install

# # Check here for latest versions: http://sourceforge.net/projects/tmux/files/tmux/
# cd ~/
# git clone https://github.com/tmux/tmux.git
# cd tmux
# sh autogen.sh
# ./configure && make



################################################################################
### Changes to Apache config file
# DocumentRoot "/var/www/html" => DocumentRoot "/websites"
# <Directory "/var/www/html"> => <Directory "/websites">
# Options Indexes FollowSymLinks => Options Includes FollowSymLinks
# AllowOverride None => AllowOverride All

mkdir /websites
chown vagrant:vagrant /websites
usermod -aG vagrant apache



################################################################################
### Install RVM, Ruby and Rails
sudo su vagrant
cd ~/
command curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
#curl -L get.rvm.io | bash -s stable
curl -L https://get.rvm.io | sudo bash -s stable --autolibs=enabled --ruby --rails
sudo usermod -aG rvm vagrant
source /etc/profile.d/rvm.sh
rvm requirements


echo "\n\n\n ************ Disable SELINUX ************ \n\n\n"
cat /etc/selinux/config

################################################################################
### Install Phusion Passenger
sudo curl --fail -sSLo /etc/yum.repos.d/passenger.repo https://oss-binaries.phusionpassenger.com/yum/definitions/el-passenger.repo
sudo yum install -y mod_passenger

