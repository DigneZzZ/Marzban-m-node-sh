#!/bin/bash
echo '  

███╗   ███╗ █████╗ ██████╗ ███████╗██████╗  █████╗ ███╗   ██╗    ███╗   ██╗ ██████╗ ██████╗ ███████╗    
████╗ ████║██╔══██╗██╔══██╗╚══███╔╝██╔══██╗██╔══██╗████╗  ██║    ████╗  ██║██╔═══██╗██╔══██╗██╔════╝    
██╔████╔██║███████║██████╔╝  ███╔╝ ██████╔╝███████║██╔██╗ ██║    ██╔██╗ ██║██║   ██║██║  ██║█████╗      
██║╚██╔╝██║██╔══██║██╔══██╗ ███╔╝  ██╔══██╗██╔══██║██║╚██╗██║    ██║╚██╗██║██║   ██║██║  ██║██╔══╝      
██║ ╚═╝ ██║██║  ██║██║  ██║███████╗██████╔╝██║  ██║██║ ╚████║    ██║ ╚████║╚██████╔╝██████╔╝███████╗    
╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝    ╚═╝  ╚═══╝ ╚═════╝ ╚═════╝ ╚══════╝    

                                
                           
BBBB  Y   Y     DDD  III  GGG  N   N EEEE ZZZZZ ZZZZZ ZZZZZ 
B   B  Y Y      D  D  I  G     NN  N E       Z     Z     Z  
BBBB    Y       D  D  I  G  GG N N N EEE    Z     Z     Z   
B   B   Y       D  D  I  G   G N  NN E     Z     Z     Z    
BBBB    Y       DDD  III  GGG  N   N EEEE ZZZZZ ZZZZZ ZZZZZ 
                                                            
Marzban Multi Node Script
Visit: https://openode.ru
'
sleep 2s
# Обновление и установка пакетов
sudo apt-get update -qq && sudo apt-get upgrade -yqq

# Установка необходимых пакетов
apt install curl socat git -yqq

# Установка Docker
curl -fsSL https://get.docker.com | sh

# Создание директории и файлов
mkdir -p /var/lib/marzban-node/
touch /var/lib/marzban-node/server1.pem
touch /var/lib/marzban-node/server2.pem

# Переход в директорию Marzban-node
cd Marzban-node

# Запрашиваем количество Main серверов
echo "Сколько Main серверов вы хотите подключить?"
echo "1 - Один сервер"
echo "2+ - Два и более серверов"
read -p "Введите ваш выбор: " choice

if [[ $choice == "1" ]]; then
    # Количество серверов равно 1
    echo "Выбрано подключение одного Main сервера."
elif [[ $choice == "2+" ]]; then
    # Количество серверов больше 1
    echo "Выбрано подключение двух и более Main серверов."
    
    # Замена содержимого docker-compose.yml
    curl -fsSL https://raw.githubusercontent.com/DigneZzZ/Marzban-m-node-sh/main/docker-compose.yml -o docker-compose.yml
else
    echo "Некорректный выбор!"
    exit 1
fi

# Уведомление для пользователя
echo "Сперва вам нужно заполнить файлы сертификатов необходимыми данными: nano /var/lib/marzban-node/server1.pem"
sleep 1s
echo "А затем выполнить команду docker compose up -d !"
