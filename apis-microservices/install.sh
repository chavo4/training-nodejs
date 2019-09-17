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
# Install MongoDB
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
apt-get update
apt-get install -y mongodb-org
# Start Mongo service
systemctl enable mongod.service
systemctl start mongod.service
export MONGO_URI=mongodb://127.0.0.1:27017/admin
# give few seconds to mongodb
sleep 5
# start node app
cd /vagrant
[ -d /usr/lib/node_modules/ ] && npm install -g --no-optional mongodb
[ -d /usr/lib/node_modules/ ] && npm install -g --no-optional mongoose
[ -d /usr/lib/node_modules/ ] && npm install -g --no-optional body-parser
[ -d /usr/lib/node_modules/ ] && npm install -g --no-optional dns
[ -d /usr/lib/node_modules/ ] && npm install -g --no-optional cors
[ -d /usr/lib/node_modules/ ] && npm install -g --no-optional express
ln -s /usr/lib/node_modules /vagrant/node_modules
node server.js &
echo "Please use the following address to access the app"
echo 'http://192.168.56.56:3000'
