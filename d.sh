#apt-get update && apt-get install -y nginx mc curl python3-pip git && 
#pip3 install django==1.10.5 &&
#pip3 install gunicorn=19.6.0 &&
sudo rm /etc/nginx/sites-available/default && 
sudo ln -sf /home/box/web/etc/nginx.conf /etc/nginx/sites-available/default && 
sudo /etc/init.d/nginx restart &&
cd /home/box/web &&
gunicorn --log-file error_log.log --access-logfile acclog -b 0.0.0.0:8080 -w 4 -D hello:app 
django-admin.py startproject ask &&
cd ask &&
django-admin.py startapp qa &&
rm /home/box/web/ask/qa/views.py &&
ln -sf /home/box/web/views.py /home/box/web/ask/qa/views.py &&
ln -sf /home/box/web/urls.py /home/box/web/ask/qa/urls.py &&
rm /home/box/web/ask/ask/urls.py &&
ln -sf /home/box/web/urls1.py /home/box/web/ask/ask/urls.py &&
ln -sf /home/box/web/urls.py /home/box/web/ask/qa/urls.py &&
gunicorn --log-file error.log --access-logfile acc.log --log-level debug -b 0.0.0.0:8000  -w 4 -D ask.wsgi
