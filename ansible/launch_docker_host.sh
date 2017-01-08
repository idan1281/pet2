#!/bin/sh
read -p "Please enter the full path of the tikal.pem file : " path

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

# Running the Ansible playbook
  ansible-playbook playbooks/launch_instance.yml --private-key "$path" --ask-vault-pass
fi
