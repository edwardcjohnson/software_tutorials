* Fork https://gitlab.com/edwardjohnson/tabula_rasa to leverage a template repo. This will make it easier for CI/CD later on.
* Follow setup instructions: [Developing inside a Container](https://code.visualstudio.com/docs/remote/containers)
* [Tutorial: Remote development inside a container](https://code.visualstudio.com/docs/remote/containers-tutorial)
  * Select Remote-Containers: Try a Sample...
  * Once the "Dev Container: Python 3" terminal opens then open the README.md for specific instructions.
 * Once you have the docker container built and attach VSCode, you will want to generate an SSH key and add the SSH key GitHub or GitLab so you can push/pull.
   * https://github.com/edwardcjohnson/software_tutorials/blob/master/linux/generate_ssh_key_for_git.md
 * Set you environmental vars in Gitlab. Be sure all vars referenced in setup.py are captured.
 * If you want to deposit your built pypi package to your personal Gitlab pypi library then follow this:
   * https://docs.gitlab.com/ee/user/packages/pypi_repository/index.html
 * Start a jupyter nb inside the container using:
   * jupyter notebook --ip=0.0.0.0 --allow-root
