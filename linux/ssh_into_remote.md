# SSH from local machine to remote machine
* Install OpenSSH on the remote machine: $ sudo apt install -y openssh-server
* Download kitty and winscp on your local machine
* Acquire the IP address of the remote machine (e.g. from the remote machine's terminal enter: hostname -I)
* Open kitty and enter the IP address found from the previous step into the section called "Host Name (or IP Address)"
* When prompted, enter your username and password for the remote machine
* Connect via VSCode by following this tutorial: https://code.visualstudio.com/docs/remote/ssh-tutorial
