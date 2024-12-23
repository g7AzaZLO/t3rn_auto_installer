#!/bin/bash
echo "Загрузка исполняемого файла..."
wget https://github.com/t3rn/executor-release/releases/download/v0.21.9/executor-linux-v0.21.9.tar.gz -O executor-linux.tar.gz
echo "Распаковка архива..."
tar -xzvf executor-linux.tar.gz
cd executor || exit 1
echo "Настройка параметров среды..."
export NODE_ENV="testnet"
export LOG_LEVEL="debug"
export LOG_PRETTY="false"
export EXECUTOR_PROCESS_ORDERS="true"
export EXECUTOR_PROCESS_CLAIMS="true"
echo "Введите ваш приватный ключ"
read -s -p "Приватный ключ: " PRIVATE_KEY_LOCAL
echo
export PRIVATE_KEY_LOCAL="$PRIVATE_KEY_LOCAL"
export ENABLED_NETWORKS="arbitrum-sepolia,base-sepolia,optimism-sepolia,l1rn"
echo "Запуск узла в screen сессии..."
cd /root/executor/executor/bin/ || exit 1
screen -dmS t3rn_node bash -c './executor; exec bash'
echo "Установка и запуск завершены. Узел запущен в screen-сессии с именем 't3rn_node'."
echo -e "\033[1;36m"
echo -e "████╗░██████╗░███████╗████╗  ░█████╗░███████╗░█████╗░███████╗██╗░░░░░░█████╗░"
echo -e "██╔═╝██╔════╝░╚════██║╚═██║  ██╔══██╗╚════██║██╔══██╗╚════██║██║░░░░░██╔══██╗"
echo -e "██║░░██║░░██╗░░░░░██╔╝░░██║  ███████║░░███╔═╝███████║░░███╔═╝██║░░░░░██║░░██║"
echo -e "██║░░██║░░╚██╗░░░██╔╝░░░██║  ██╔══██║██╔══╝░░██╔══██║██╔══╝░░██║░░░░░██║░░██║"
echo -e "████╗╚██████╔╝░░██╔╝░░████║  ██║░░██║███████╗██║░░██║███████╗███████╗╚█████╔╝"
echo -e "╚═══╝░╚═════╝░░░╚═╝░░░╚═══╝  ╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝╚══════╝╚══════╝░╚════╝░"
echo -e "\033[1;34m"
echo
echo -e "\033[1;32mTelegram community: \033[5;31mhttps://t.me/g7team_ru\033[0m"
echo -e "\033[0m"
echo
echo "Установка завершена. Для просмотра логов зайдите в скрин сессию: screen -r t3rn_node"
