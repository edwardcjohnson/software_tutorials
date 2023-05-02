The VSCode extension Remote-Containers creates temporary folders and files on a machine (remote one if we work with docker server) at /tmp/vsch/ <br>
The issue is that the folder vsch itself is created using current user's credentials and is deleted after the user is done. 
Therefore, by default the folder is not writable by subsequent users. <br>
The solution is as follows: <br>

1. SSH to remote server

2. Allow full control for all users over /tmp/vsch/. Note: Your user needs to be a sudo user to be able to run the command. <br>

`sudo chmod -R o=rwx /tmp/vsch`
