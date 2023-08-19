#a fazer

#######################################################

clear

echo -e "\e[32m\e[0m"
echo -e "\e[32m\e[0m"
echo -e "\e[32m _______                   ___  _                                         _        \e[0m"
echo -e "\e[32m(_______)                 / __)(_)                                       | |       \e[0m"
echo -e "\e[32m _         ___   ____   _| |__  _   ____  _   _   ____  _____  ____    __| |  ___  \e[0m"
echo -e "\e[32m| |       / _ \ |  _ \ (_   __)| | / _  || | | | / ___)(____ ||  _ \  / _  | / _ \ \e[0m"
echo -e "\e[32m| |_____ | |_| || | | |  | |   | |( (_| || |_| || |    / ___ || | | |( (_| || |_| |\e[0m"
echo -e "\e[32m \______) \___/ |_| |_|  |_|   |_| \___ ||____/ |_|    \_____||_| |_| \____| \___/ \e[0m"
echo -e "\e[32m                                  (_____|                                          \e[0m"
echo -e "\e[32m          _______   _____   _______ \e[0m"
echo -e "\e[32m         (_______) (_____) (_______)\e[0m"
echo -e "\e[32m  ___     _     _   _____   _     _ \e[0m"
echo -e "\e[32m / _ \   | |   | | / ___ \ | |   | |\e[0m"
echo -e "\e[32m| |_| |  | |   | |( (___) )| |   | |\e[0m"
echo -e "\e[32m \___/   |_|   |_| \_____/ |_|   |_|\e[0m"
echo -e "\e[32m                                    \e[0m"
echo -e "\e[32mv0.230.3\e[0m"
echo -e "\e[32m\e[0m"

#######################################################

echo "Preencha as informações a serguir para instalar o n8n"
echo ""
read -p "Digite seu dominio para acessar o n8n (ex: n8n.dominio.com): " dominion8n
echo ""
echo "Link do n8n: $dominion8n"
echo ""
read -p "As informações estão certas? (y/n): " confirma1
if [ "$confirma1" == "y" ]; then

#######################################################

echo "Instalando as Dependencias"

sleep 3

clear

sudo npm install -g n8n@0.230.3

npm install pm2 -g

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo apt install ./google-chrome-stable_current_amd64.deb

#########################################################

echo "Proxy Reverso"

sleep 3

clear

cd

cat > n8n << EOL
server {
  server_name $dominion8n;
  
  underscores_in_headers on;

  location / {

   proxy_pass http://127.0.0.1:5678;
   proxy_pass_header Authorization;
   proxy_set_header Upgrade $http_upgrade;
   proxy_set_header Connection "upgrade";
   proxy_set_header Host $host;
   proxy_set_header X-Forwarded-Proto $scheme;
   proxy_set_header X-Forwarded-Ssl on; # Optional
   proxy_set_header X-Real-IP $remote_addr;
   proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
   proxy_http_version 1.1;
   proxy_set_header Connection "";
   proxy_buffering off;
   client_max_body_size 0;
   proxy_read_timeout 36000s;
   proxy_redirect off;
  }
  add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
  ssl_protocols TLSv1.2 TLSv1.3;
}
EOL

#########################################################

sudo mv n8n /etc/nginx/sites-available/n8n

sudo ln -s /etc/nginx/sites-available/n8n /etc/nginx/sites-enabled

sudo certbot --nginx

sudo service nginx restart

pm2 start n8n --cron-restart="0 0 * * *" -- start

sudo pm2 startup ubuntu -u root && sudo pm2 startup ubuntu -u root --hp /root && sudo pm2 save

cd

#########################################################

echo -e "\e[32m\e[0m"
echo -e "\e[32m\e[0m"
echo -e "\e[32m\e[0m"
echo -e "\e[32m\e[0m"
echo -e "\e[32m\e[0m"
echo -e "\e[32m\e[0m"
echo -e "\e[32m _                             _              _        \e[0m"
echo -e "\e[32m| |                _          | |            | |       \e[0m"
echo -e "\e[32m| | ____    ___  _| |_  _____ | |  _____   __| |  ___  \e[0m"
echo -e "\e[32m| ||  _ \  /___)(_   _)(____ || | (____ | / _  | / _ \ \e[0m"
echo -e "\e[32m| || | | ||___ |  | |_ / ___ || | / ___ |( (_| || |_| |\e[0m"
echo -e "\e[32m|_||_| |_|(___/    \__)\_____| \_)\_____| \____| \___/ \e[0m"
echo -e "\e[32m                                                       \e[0m"              
echo -e "\e[32m\e[0m"
echo -e "\e[32m\e[0m"
echo -e "\e[32mAcesse seu N8N: https://$dominion8n\e[0m"
echo -e "\e[32m\e[0m"
echo -e "\e[32mInscreva-se no meu Canal: https://youtube.com/oriondesign_oficial\e[0m"
echo -e "\e[32m\e[0m"
echo -e "\e[32mSugestões ou duvidas: https://wa.me/+5511973052593\e[0m"
echo -e "\e[32m\e[0m"
echo -e "\e[32m\e[0m"
echo -e "\e[32m\e[0m"
echo -e "\e[32m\e[0m"

#########################################################

elif [ "$confirma1" == "n" ]; then
    echo "Encerrando a instalação."
    exit 0
else
    echo "Resposta inválida. Digite 'y' para confirmar ou 'n' para encerrar a instalação."
    exit 1
fi
