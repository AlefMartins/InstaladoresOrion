#########################################################

loading() {
    local duration=2
    local width=$2 
    local interval=0.02
    local progress=0     

    while [ $progress -le 100 ]; do
        local bar=$(printf "[%-${width}s]" $(printf "=%.0s" $(seq 1 $(($progress * $width / 100)))))
        printf "\rCarregando... $bar%3d%%" $progress
        sleep $interval
        progress=$((progress + 1))
    done

    clear
}

width=100 

#########################################################

clear

echo -e "\e[32m\e[0m"
echo -e "\e[32m\e[0m"
echo -e "\e[32m ______             _____          _                _____                 _               \e[0m"
echo -e "\e[32m(____  \           / ___ \        (_)              (____ \               (_)              \e[0m"
echo -e "\e[32m ____)  ) _   _   | |   | |  ____  _   ___   ____   _   \ \   ____   ___  _   ____  ____  \e[0m"
echo -e "\e[32m|  __  ( | | | |  | |   | | / ___)| | / _ \ |  _ \ | |   | | / _  ) /___)| | / _  ||  _ \ \e[0m"
echo -e "\e[32m| |__)  )| |_| |  | |___| || |    | || |_| || | | || |__/ / ( (/ / |___ || |( ( | || | | |\e[0m"
echo -e "\e[32m|______/  \__  |   \_____/ |_|    |_| \___/ |_| |_||_____/   \____)(___/ |_| \_|| ||_| |_|\e[0m"
echo -e "\e[32m         (____/                                                             (_____|       \e[0m"
echo -e "\e[32m\e[0m"
echo -e "\e[32m\e[0m"

loading 2 $width

#########################################################

while true; do

clear

echo -e "\e[32m\e[0m"
echo -e "\e[32m\e[0m"
echo -e "\e[32m _______                             _           _______                      \e[0m"
echo -e "\e[32m(_______)                           | |         (_______)          _          \e[0m"
echo -e "\e[32m _  _  _  _____  ____   _   _     __| | _____    _______  _   _  _| |_   ___  \e[0m"
echo -e "\e[32m| ||_|| || ___ ||  _ \ | | | |   / _  || ___ |  |  ___  || | | |(_   _) / _ \ \e[0m"
echo -e "\e[32m| |   | || ____|| | | || |_| |  ( (_| || ____|  | |   | || |_| |  | |_ | |_| |\e[0m"
echo -e "\e[32m|_|   |_||_____)|_| |_||____/    \____||_____)  |_|   |_||____/    \__) \___/ \e[0m"
echo -e "\e[32m                                                                              \e[0m"
echo -e "\e[32m _                             _              _                            \e[0m"
echo -e "\e[32m| |                _          | |            | |                           \e[0m"
echo -e "\e[32m| | ____    ___  _| |_  _____ | |  _____   __| |  ___    ____  _____   ___ \e[0m"
echo -e "\e[32m| ||  _ \  /___)(_   _)(____ || | (____ | / _  | / _ \  / ___)| ___ | /___)\e[0m"
echo -e "\e[32m| || | | ||___ |  | |_ / ___ || | / ___ |( (_| || |_| || |    | ____||___ |\e[0m"
echo -e "\e[32m|_||_| |_|(___/    \__)\_____| \_)\_____| \____| \___/ |_|    |_____)(___/ \e[0m"
echo -e "\e[32m\e[0m"
echo -e "\e[32m\e[0m"                                                                           

#########################################################

echo "Digite o numero da opção desejada"
echo ""
echo "1 - Chatwoot"
echo "2 - N8N"
echo "3 - Quepasa (desativado)"
echo "4 - Evolution"
echo "5 - Typebot"
#echo "6 - Combo 1 (Chatwoot + N8N + QuepasaAPI)"
#echo "7 - Combo 2 (Chatwoot + EvolutionAPI)"
#echo "8 - Combo 3 (Chatwoot + EvolutionAPI + Typebot + N8N)"
echo "9 - Sair do Auto Instalador"
echo ""
read -p "Escolha uma opção: " choice

case $choice in
    1)
        chmod +x 1-chatwoot.sh
        ./1-chatwoot.sh
        ;;
    2)
        chmod +x 2-n8n.sh
        ./2-n8n.sh
        ;;
    3)
        chmod +x quepasa.sh
        ./quepasa.sh
        ;;
    4)
        chmod +x evolution.sh
        ./evolution.sh
        ;;
    5)
        chmod +x typebot.sh
        ./typebot.sh
        ;;
    6)
        chmod +x combo1.sh
        ./combo1.sh
        ;;
    7)
        chmod +x combo2.sh
        ./combo2.sh
        ;;
    8)
        chmod +x combo2.sh
        ./combo2.sh
        ;;
    9)
        echo "Encerrando o Auto Instalador."
        echo ""
        clear

        echo -e "\e[32m\e[0m"
        echo -e "\e[32m\e[0m"
        echo -e "\e[32m ______             _____          _                _____                 _               \e[0m"
        echo -e "\e[32m(____  \           / ___ \        (_)              (____ \               (_)              \e[0m"
        echo -e "\e[32m ____)  ) _   _   | |   | |  ____  _   ___   ____   _   \ \   ____   ___  _   ____  ____  \e[0m"
        echo -e "\e[32m|  __  ( | | | |  | |   | | / ___)| | / _ \ |  _ \ | |   | | / _  ) /___)| | / _  ||  _ \ \e[0m"
        echo -e "\e[32m| |__)  )| |_| |  | |___| || |    | || |_| || | | || |__/ / ( (/ / |___ || |( ( | || | | |\e[0m"
        echo -e "\e[32m|______/  \__  |   \_____/ |_|    |_| \___/ |_| |_||_____/   \____)(___/ |_| \_|| ||_| |_|\e[0m"
        echo -e "\e[32m         (____/                                                             (_____|       \e[0m"
        echo -e "\e[32m\e[0m"
        echo -e "\e[32m\e[0m"
        sleep 2
        exit 0
        ;;
    *)
        echo "Opção inválida. Digite um número de 1 a 8."
        sleep 2
        ;;
esac
        read -p "Pressione Enter para continuar..."

done
