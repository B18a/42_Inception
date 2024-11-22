#!/bin/bash

cd app/data

# update nvm    
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.bashrc

nvm install --lts
nvm install node

git clone https://github.com/louislam/uptime-kuma.git
cd uptime-kuma
npm run setup

# Option 1. Try it
node server/server.js

# # (Recommended) Option 2. Run in the background using PM2
# # Install PM2 if you don't have it:
# npm install pm2 -g && pm2 install pm2-logrotate

# # Start Server
# pm2 start server/server.js --name uptime-kuma

# # If you want to see the current console output
# pm2 monit

# # If you want to add it to startup
# pm2 save && pm2 startup

# 127.0.0.1:3001:3001