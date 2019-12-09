1. Persisting Environment Variables for a User:
* `vim ~/.bash_profile`
* Add the variables. E.g.:
  * `export JAVA_HOME=/opt/openjdk11`
* Save the file and source it, so the changes take effect:
  * source ~/.bash_profile
2. Setting Persistent Global Environment Variables.
* When an environment variable needs to persist globally across the entire system, 
we can set it in the default profile loaded by all users on the system.
* All global profile settings are stored under /etc/profile.
While this file can be edited directory, 
it is recommended to store global environment variables in a directory named /etc/profile.d, 
where you will find a list of files that are used to set environment variables for the entire system.

* Create a new file under /etc/profile.d to store the global environment variable(s). 
* The name of the file should be contextual to help others understand its purpose.
 * `sudo touch /etc/profile.d/http_proxy.sh`
* Open the default profile into a text editor.
 * `sudo vim /etc/profile.d/http_proxy.sh`
* Add new lines to export the environment variables:
`export HTTP_PROXY=http://my.proxy:8080`
`export HTTPS_PROXY=https://my.proxy:8080`
`export NO_PROXY=localhost,::1,.example.com`
* Save your changes and exit the text editor
