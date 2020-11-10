## How to install the 64-bit version of Anaconda 4.1.1:

1. Open the Terminal: `ctrl + alt + t`
2. Enter: `wget https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh` (view releases at: https://repo.anaconda.com/archive/)
3. Enter:`bash Anaconda3-2020.07-Linux-x86_64.sh`
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

