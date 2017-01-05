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
  ansible-playbook /Users/c5240533/ansible-aws/playbooks/run_docker_image.yml --inventory ./playbooks/dockerhost_inventory --private-key "$path"
fi
