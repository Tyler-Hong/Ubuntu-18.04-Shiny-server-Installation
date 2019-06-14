# Ubuntu 18.04.2 LTS bionic

# reset root pw
passwd 

# add user
adduser tyler 

# add user to sudo
usermod -aG sudo tyler 

# switch to tyler, a non-root user with sudo privilege
su tyler

# update
sudo apt-get update

# --------------------mongoDB----------------------------------

# install package for mongodb
sudo apt-get install -y libssl-dev libsasl2-dev

# Import the public key used by the package management system.
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4

# Create a list file for MongoDB.
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list

# Reload local package database.
sudo apt-get update

# Install the MongoDB packages.
sudo apt-get install -y mongodb-org

# Start MongoDB.
sudo service mongod start

# --------------------R----------------------------------

# add the relevant GPG key.
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9

# add the repository.
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/'

# run update to include package manifests from the new repository.
sudo apt update

# install R with the following command.
sudo apt install r-base r-base-dev

# --------------------rstudio server----------------------------------

# install gdebi on ubuntu for installing any .deb file
sudo apt-get install gdebi-core

# download rstudio-server
wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-1.2.1335-amd64.deb

# install rstudio-server on Ubuntu using gdebi 
sudo gdebi rstudio-server-1.2.1335-amd64.deb

# --------------------shiny server----------------------------------

# install shiny in R
sudo su - \
-c "R -e \"install.packages('shiny', repos='https://cran.rstudio.com/')\""

# download shiny-server
wget https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.9.923-amd64.deb

# install shiny-server on Ubuntu using gdebi 
sudo gdebi shiny-server-1.5.9.923-amd64.deb

# --------------------create test app----------------------------------

# make a new folder "nav" in the shiny server app directory 
sudo mkdir /srv/shiny-server/nav

# assign ownership to user to prevent "permission denied"
sudo chown -R tyler /srv/shiny-server/nav

# switch to the new app folder 
 cd /srv/shiny-server/nav/
 
# download the server file from github repository to this folder
wget https://raw.githubusercontent.com/Tyler-Hong/Ubuntu-18.04-Shiny-server-Installation/master/server.R

# You still need the ui.R file in order to complete your first app. Log in to your rstudio server and see if you can create a new script under the same folder.


