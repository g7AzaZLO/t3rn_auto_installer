#!/bin/bash

# Øàã 1: Çàãðóçêà è ðàñïàêîâêà ôàéëà
echo "Çàãðóçêà èñïîëíÿåìîãî ôàéëà..."
wget https://github.com/t3rn/executor-release/releases/download/v0.21.7/executor-linux-v0.21.7.tar.gz -O executor-linux.tar.gz

echo "Ðàñïàêîâêà àðõèâà..."
tar -xzvf executor-linux.tar.gz
cd executor || exit

# Øàã 2: Íàñòðîéêà ïàðàìåòðîâ
echo "Íàñòðîéêà ïàðàìåòðîâ ñðåäû..."
export NODE_ENV=testnet
export LOG_LEVEL=debug
export LOG_PRETTY=false
export EXECUTOR_PROCESS_ORDERS=true
export EXECUTOR_PROCESS_CLAIMS=true

# Øàã 3: Óñòàíîâêà ïðèâàòíîãî êëþ÷à
echo "Ââåäèòå âàø ïðèâàòíûé êëþ÷:"
read -r PRIVATE_KEY_LOCAL
export PRIVATE_KEY_LOCAL

# Øàã 4: Íàñòðîéêà ïîääåðæèâàåìûõ ñåòåé
export ENABLED_NETWORKS='arbitrum-sepolia,base-sepolia,optimism-sepolia,l1rn'

# Çàïóñê óçëà â ñåññèè screen
echo "Çàïóñê óçëà â screen ñåññèè..."
cd /root/executor/executor/bin/ || exit

# Ñîçäà¸ì èëè ïîäêëþ÷àåìñÿ ê screen-ñåññèè ñ èìåíåì 'executor_session'
screen -dmS executor_session bash -c './executor; exec bash'

echo "Óñòàíîâêà è çàïóñê çàâåðøåíû. Óçåë çàïóùåí â screen-ñåññèè ñ èìåíåì 'executor_session'."
echo -e "\033[1;36m"
echo -e "----¬-------¬--------¬----¬  ------¬--------¬------¬--------¬--¬-----------¬-"
echo -e "--ã=---ã====--L====--¦L=--¦  --ã==--¬L====--¦--ã==--¬L====--¦--¦-------ã==--¬"
echo -e "--¦----¦----¬-------ã-----¦  -------¦-----ã=--------¦-----ã=---¦-------¦----¦"
echo -e "--¦----¦--L--¬-----ã------¦  --ã==--¦--ã==-----ã==--¦--ã==-----¦-------¦----¦"
echo -e "----¬L------ã-----ã-------¦  --¦----¦-------¬--¦----¦-------¬-------¬L-----ã-"
echo -e "L===--L=====----L=----L===-  L=---L=-L======-L=---L=-L======-L======--L====--"
echo -e "\033[1;34m"
echo
echo -e "\033[1;32mTelegram community: \033[5;31mhttps://t.me/g7monitor\033[0m"
echo -e "\033[0m"
echo
echo "×òîáû ïîäêëþ÷èòüñÿ ê ñåññèè, âûïîëíèòå êîìàíäó: screen -r executor_session"
