# Update packages
apt-get update
#nodesource PPA
curl -sL https://deb.nodesource.com/setup_12.x | bash -
#update package database
apt-get update
#install NodeJS
apt-get install -y nodejs
# Install NPM
apt-get install -y npm
# start node app
cd /vagrant
[ -d /usr/lib/node_modules/ ] && npm install -g --no-optional fs
[ -d /usr/lib/node_modules/ ] && npm install -g --no-optional express
ln -s /usr/lib/node_modules /vagrant/node_modules
node server.js &
echo "Please use the following address to access the app"
echo 'http://192.168.56.56:3000'
