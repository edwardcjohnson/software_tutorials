## Mount Windows (CIFS) Share in *nix
* https://www.thomas-krenn.com/en/wiki/Mounting_a_Windows_Share_in_Linux
* https://linuxize.com/post/how-to-mount-cifs-windows-share-on-linux/

command:
`sudo mount -t cifs <source> <destination> -o ro,username=<username>,domain=<domain of windows user>`
