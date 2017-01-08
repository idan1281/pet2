#!/bin/sh
read -p "Please enter the full path of the admin2.pem file : " path

#chec if path is not empty string
echo  $path
if [ -z $path ]
then
  echo "path is empty string"
  exit
fi
#check if file exist
if [ ! -f "$path" ] 
then
  echo "file doesnt exists"
else
#Running the anisble playbook
  ansible-playbook playbooks/run_docker_image.yml  --private-key "$path" --ask-vault-pass
fi
