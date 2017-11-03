#!/usr/bin/env bash

sudo yum update -y
sudo yum install -y epel-release
sudo yum install -y lynx mailx git unzip vim redis ImageMagick mysql-devel java-1.8.0-openjdk-devel nodejs gcc bzip2 kernel-devel dkms libevent-devel libxslt-devel libxml2-devel the_silver_searcher tree pgrep ncurses-devel libreoffice-base.x86_64

# Configure dotfiles
su - vagrant -c 'cd /home/vagrant && git clone https://github.com/crowesn/dotfiles.git'
su - vagrant -c 'cd /home/vagrant/dotfiles && ./install_files.sh'

# Install Vundle for Vim
su - vagrant -c 'mkdir /home/vagrant/.vim/bundle'
su - vagrant -c 'git clone https://github.com/VundleVim/Vundle.vim.git /home/vagrant/.vim/bundle/Vundle.vim'

# Install ffmpeg
su - vagrant -c 'cd /opt'
su - vagrant -c 'wget https://johnvansickle.com/ffmpeg/builds/ffmpeg-git-64bit-static.tar.xz'
su - vagrant -c 'tar -xf ffmpeg-git-64bit-static.tar.xz'
su - vagrant -c 'ln -s /opt/ffmpeg-git-20170803-64bit-static/ffmpeg /usr/bin/ffmpeg'

# Install tmux
su - vagrant -c 'mkdir /home/vagrant/install'
su - vagrant -c 'cd /home/vagrant/install && wget https://github.com/tmux/tmux/releases/download/2.2/tmux-2.2.tar.gz'
su - vagrant -c 'cd /home/vagrant/install && tar -xzf tmux-2.2.tar.gz'
su - vagrant -c 'cd /home/vagrant/install/tmux-2.2 && ./configure && make'
cd /home/vagrant/install/tmux-2.2 && sudo make install

# Install RVM
su - vagrant -c 'gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3'
su - vagrant -c 'curl -L https://get.rvm.io | bash -s stable --ruby --auto-dotfiles'
su - vagrant -c 'rvm 2.4.1 --install --default'

# install bundler
su - vagrant -c 'gem install bundler'

# Install Fits
su - vagrant -c 'cd /home/vagrant/install && wget http://projects.iq.harvard.edu/files/fits/files/fits-0.8.5.zip'
su - vagrant -c 'cd /home/vagrant/install && unzip fits-0.8.5.zip'
su - vagrant -c 'chmod u+x /home/vagrant/install/fits-0.8.5/fits.sh'

# Install phantomjs
su - vagrant -c 'cd /home/vagrant/install && wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2'
su - vagrant -c 'cd /home/vagrant/install && tar -xvf phantomjs-2.1.1-linux-x86_64.tar.bz2'
cd /home/vagrant/install/phantomjs-2.1.1-linux-x86_64/bin && sudo cp phantomjs /usr/bin

# Install Redis
su - vagrant -c 'cd /home/vagrant/install && wget http://download.redis.io/releases/redis-2.8.3.tar.gz'
su - vagrant -c 'cd /home/vagrant/install && tar xzvf redis-2.8.3.tar.gz'
su - vagrant -c 'cd /home/vagrant/install/redis-2.8.3 && make'
cd /home/vagrant/install/redis-2.8.3 && sudo make install

# Install ruby stuff
su - vagrant -c 'gem install tmuxinator'
