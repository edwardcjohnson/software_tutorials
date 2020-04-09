## How to install the 64-bit version of Anaconda 4.1.1:

1. Open the Terminal: `ctrl + alt + t`
2. Enter: `wget http://repo.continuum.io/archive/Anaconda3-4.2.0-Linux-x86_64.sh`
3. Choose the python version:
  1. For the Python 3.5 version enter:`bash Anaconda3-4.2.0-Linux-x86_64.sh`
  2. For the Python 2.7 version enter: `bash Anaconda3-4.2.0-Linux-x86_64.sh`

4. Follow the instructions on the screen
5. To update Anaconda enter:
`conda update anaconda`
6. Source ~/.bashrc since PATH was updated
`source ~/.bashrc`
7. Create a new environment
`conda create -n <yourenvname> python=3.8 anaconda`
8. Activate the new environment
`source activate <yourenvname>`
9. If desired, install jupyter 
`conda install jupyter`

