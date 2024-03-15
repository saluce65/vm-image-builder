sudo echo "[network]" >> /etc/wsl.conf
sudo echo "generateResolvConf = false" >> /etc/wsl.conf
sudo rm /etc/resolv.conf
sudo echo "nameserver 172.17.30.32\nnameserver 172.17.30.31" > /etc/resolv.conf
curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor --yes -o /usr/share/keyrings/redis-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list > /dev/null
sudo apt-get update
sudo apt-get install redis