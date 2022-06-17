* Pre-requisites

    * Install VSCode

      * Install the Remote Development Extension Pack: https://aka.ms/vscode-remote/download/extension

    * Install following VSCode extensions:

        * Remote development extension pack

            * https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack

        * Remote-Containers

        * Remote-SSH

* VSCode dev-container setup

    * Launch VSCode

    * Connect to server vis SSH

        * open Command Palette (Ctrl+Shift+P)

        * search for Remote-SSH: Connect to Host

        * enter host connection string ssh <user name>@<server address>

        * add private key if you use key-based authorization (check links below)

    * Clone repository

        * open a new terminal in VSCode (Ctrl+Shift+`)

        * navigate to /home/<user name>/:
        cd ~

        * make directory projects:
        mkdir -p projects && cd projects

        * clone git repository for relevant project:
        git clone <uri of your git project on Github>

    * Open cloned folder in VSCode

        * File->Open Folder

        * navigate to /home/<user name>/projects/<project name>

    * Create a new development container in VSCode
        * Verify that your .devcontainer/.devcontainer.json has an image name defined and that that image already exists on the server. If it doesn't exist then you will need to build the image before continuing.

        * open Command Palette (Ctrl+Shift+P)

        * search for Remote-Containers: Reopen in Container

            * If you get this message: "current user does not have permission to run docker", then your user likely needs to be assigned to the docker group. You can check what groups you’re in by entering: groups. To add your user to the docker group, execute the following command:

                * sudo usermod -aG docker $USER

                * Then log out and log back in so that your group membership is re-evaluated

    * Rename newly created container

        * connect to server vis ssh

        * run docker ps command to list running containers

        * locate your container by the most recent one with respect to CREATED column

        * rename the container (current name is in the NAMES column)
          * docker rename <current name> <project name>_<user nickname>
