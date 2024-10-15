#!/bin/bash

# ��� 1: �������� � ���������� �����
echo "�������� ������������ �����..."
wget https://github.com/t3rn/executor-release/releases/download/v0.21.7/executor-linux-v0.21.7.tar.gz -O executor-linux.tar.gz

echo "���������� ������..."
tar -xzvf executor-linux.tar.gz
cd executor || exit

# ��� 2: ��������� ����������
echo "��������� ���������� �����..."
export NODE_ENV=testnet
export LOG_LEVEL=debug
export LOG_PRETTY=false
export EXECUTOR_PROCESS_ORDERS=true
export EXECUTOR_PROCESS_CLAIMS=true

# ��� 3: ��������� ���������� �����
echo "������� ��� ��������� ����:"
read -r PRIVATE_KEY_LOCAL
export PRIVATE_KEY_LOCAL

# ��� 4: ��������� �������������� �����
export ENABLED_NETWORKS='arbitrum-sepolia,base-sepolia,optimism-sepolia,l1rn'

# ������ ���� � ������ screen
echo "������ ���� � screen ������..."
cd /root/executor/executor/bin/ || exit

# ������ ��� ������������ � screen-������ � ������ 'executor_session'
screen -dmS executor_session bash -c './executor; exec bash'

echo "��������� � ������ ���������. ���� ������� � screen-������ � ������ 'executor_session'."
echo -e "\033[1;36m"
echo -e "----�-------�--------�----�  ------�--------�------�--------�--�-----------�-"
echo -e "--�=---�====--L====--�L=--�  --�==--�L====--�--�==--�L====--�--�-------�==--�"
echo -e "--�----�----�-------�-----�  -------�-----�=--------�-----�=---�-------�----�"
echo -e "--�----�--L--�-----�------�  --�==--�--�==-----�==--�--�==-----�-------�----�"
echo -e "----�L------�-----�-------�  --�----�-------�--�----�-------�-------�L-----�-"
echo -e "L===--L=====----L=----L===-  L=---L=-L======-L=---L=-L======-L======--L====--"
echo -e "\033[1;34m"
echo
echo -e "\033[1;32mTelegram community: \033[5;31mhttps://t.me/g7monitor\033[0m"
echo -e "\033[0m"
echo
echo "����� ������������ � ������, ��������� �������: screen -r executor_session"
