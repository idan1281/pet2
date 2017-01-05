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
  ansible-playbook playbooks/launch_instance.yml --private-key "$path"
fi

git add -A inventories
git commit -m "adding the docjerhost inventory file to Github"
git git push origin master
