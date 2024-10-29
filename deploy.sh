#!/bin/bash

option=$1
SERVERS="manna@10.100.100.27 manna@10.100.100.28"

# 인자 확인 및 분기처리
if [ "$option" = "test" ]; then
  sshpass -p "Ekswnr59!@" scp -r build/libs/jesica-admin-service.war manna@10.100.100.140:/manna/mannaAdmin

  echo "전송 완료(dev)!!"
elif [ "$option" = "prod" ]; then

  for host in $SERVERS;
  do
      sshpass -p "Ekswnr59!@" scp -r build/libs/jesica-admin-service.war $host:/manna/jesicar/backup
      sshpass -p "Ekswnr59!@" scp -r build/libs/jesica-admin-service.war $host:/manna/jesicar/jesicar-admin-server
  done
  echo "전송 완료(prod)!!"
else
  echo "deploy 방법을 선택해주세요!!"
fi
  echo "Process Succeed!!"
