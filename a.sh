#cd /home
#mkdir box 
#cd box
#mkdir web
#cd web
#mkdir public uploads etc
#cd public
#mkdir img css js
#apt-get update && apt-get install -y nginx mc curl && 
sudo rm /etc/nginx/sites-available/default && 
sudo ln -sf /home/box/web/etc/nginx.conf /etc/nginx/sites-available/default && 
sudo /etc/init.d/nginx restart
