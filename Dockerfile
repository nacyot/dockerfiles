FROM ubuntu:12.04
MAINTAINER Daekwon Kim <propellerheaven@gmail.com>

# Run upgrades
# From https://github.com/crashsystems/gitlab-docker
RUN echo deb http://archive.ubuntu.com/ubuntu/ precise universe multiverse >> /etc/apt/sources.list;\
  echo deb http://archive.ubuntu.com/ubuntu/ precise-updates main restricted universe >> /etc/apt/sources.list;\
  echo deb http://security.ubuntu.com/ubuntu precise-security main restricted universe >> /etc/apt/sources.list;\
  echo udev hold | dpkg --set-selections;\
  echo initscripts hold | dpkg --set-selections;\
  echo upstart hold | dpkg --set-selections;\
  apt-get update;\
  apt-get -qq -y upgrade

# Install Git
RUN add-apt-repository -y ppa:git-core/ppa;\
  apt-get update;\
  apt-get -qq -y install git

# Install packages for building Ruby
RUN apt-get install -qy build-essential zlib1g-dev libyaml-dev libssl-dev libgdbm-dev libreadline-dev libncurses5-dev libffi-dev curl libxml2-dev libxslt-dev libcurl4-openssl-dev libicu-dev 

# Install Ruby
RUN mkdir /tmp/ruby;\
  cd /tmp/ruby;\
  curl ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p353.tar.gz | tar xz;\
  cd ruby-2.0.0-p353;\
  chmod +x configure;\
  ./configure --disable-install-rdoc;\
  make;\
  make install;\
  gem install bundler --no-ri --no-rdoc

# Install packages for installing Huboard 
RUN apt-get -qq -y install couchdb memcached nodejs
RUN gem install foreman

# Install Huboard
RUN git clone -b master https://github.com/rauhryan/huboard.git /app
RUN cd /app; bundle install;
ADD .env /app/.env
ADD Procfile /app/Procfile

# Run Huboard instance
EXPOSE 5000
CMD foreman start -f /app/Procfile
