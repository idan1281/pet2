# Pettclinic CI/CD Project


## Introduction
This project allows you to use the CI/CD procecss for deploying the Spring-Petclinic application on an AWS environment automatically 

### System components:
* `Jenkins` (automation server).
* `Amazon AWS`.
* `Ansible` (Configuration Management tool). 
* `Dokcer Hub` (Dicker images repository).
* `Spring-PetClinic` (example application).


## prerequisite
1.	Ansible installed on your client
2.	EC2 modules for Ansible require the `boto` and `boto3` python library to work --> ( sudo pip install boto boto3 )
3. Setting up 2 environment variables:
 
		AWS_ACCESS_KEY_ID
		AWS_SECRET_ACCESS_KEY

### Pre-Setup
1. Start by cloning this repo: ( git clone //github.com/idan1281/pet2.git )
2.	Copy the **ec2.py** and **ec2.ini** provided in the repo to **/etc/ansible**  
 
>__Note__: If you don’t have an **/etc/ansible** folder please create one ( mkdir –p /etc/Ansible )

####	 Installing the docker host 
2.	Save the ssh key file provided in the email to the location of your choice 
	*  change it’s permissions to 0400 ( chmod 0400 $File_path )3.	cd into the repo/ansible folder, e.g pet2/ansible4.	execute: 

		./launch_docker_host.sh
	 5.	Enter the full path for the SSH key you saved in the first clause6.	Enter the password for the Ansible vault
7. **save the server's IP address so for future accessing the app.**


### building the app
The app is configured to be buidld on a jenkins server which will also run the apps unit tests.
the server is configured to run a build on every commit made to the repository.
to manually trigger the build you need to:

1.	Log into the [jenkins server ](https://www.google.com)
 	* username - tikal
	* password - provided in an email
2.	Go to the job "petclinic-build" and run it. the job will than run all unit tests, if passed it will create a costumized docker image, upload it to the docker hub and than call another 
3. the rest is handled automatically 

##### Deploying the APP
If all you want is to automatically deploy the app and using the previous build and release you can do it in 2 ways:

1.	from the Jenkins console run the project "petclinic-build"
2. cd into the repo/ansible folder, e.g pet2/ansible4.	execute: 

		./run_container.sh
	 5.	Enter the full path for the SSH key you saved in the first clause6.	Enter the password for the Ansible vault

		If you encounter the error: 		ERROR! Attempted to execute "/etc/ansible/ec2.py" as inventory script: Inventory script (/etc/ansible/ec2.py) had an execution error: Traceback (most recent call last):		File "/etc/ansible/ec2.py", line 128, in <module>		import boto		ImportError: No module named boto		It means that your Ansible can’t find your boto installation. It can usually resolved by setting an env variable named PYTHONPATH for the “site-packages” location on which python is installed in. for example: 		export PYTHONPATH=/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages 7.	run the script again

### Test the app
* open a web browser, put in the IP address you saved from the "create a doker host" section, add :8888/petclinic to it ( e.g 10.0.0.10:8888/petclinic ) and you should see the petcilic wellcome page

## License and Authors
Authors: Chen Cohen (idan.mishor@sap.com)