
## Guide: Installing Anaconda Automatically on Linux

This guide uses an automated script to find, download, and install the **latest** 64-bit Anaconda Distribution without manual version checking.
-----

### Step 1: Prepare the Installation Script

First, you need to create the script file and make it executable.

1.  **Open the Terminal** (usually $\text{Ctrl} + \text{Alt} + \text{T}$).

2.  **Create the script file** using a text editor like `nano` or `vi`:

    ```bash
    nano install_anaconda.sh
    ```

3.  **Paste the following script content** into the editor:

    ```bash
    #!/bin/bash

    # Define the repository URL
    REPO_URL="https://repo.anaconda.com/archive/"

    # Find the name of the latest Linux x86_64 installer script
    INSTALLER_NAME=$(curl -s $REPO_URL | \
                     grep -oP 'Anaconda3-\d{4}\.\d{2}-\d-Linux-x86_64\.sh' | \
                     head -1)

    # Construct the full download URL
    DOWNLOAD_URL="$REPO_URL$INSTALLER_NAME"

    # Check if an installer name was found
    if [ -z "$INSTALLER_NAME" ]; then
        echo "Error: Could not find the latest Anaconda installer filename."
        exit 1
    fi

    # Download the installer file
    echo "Downloading the latest installer: $INSTALLER_NAME"
    wget $DOWNLOAD_URL

    # Execute Silent Installation
    INSTALL_PATH="$HOME/anaconda3"
    echo "Starting silent installation to $INSTALL_PATH..."
    bash $INSTALLER_NAME -b -p $INSTALL_PATH

    # Clean up the large downloaded file
    echo "Removing installer file..."
    rm $INSTALLER_NAME

    # Initialize Conda for the current shell
    echo "Initializing Conda for shell profiles (e.g., ~/.bashrc)..."
    $INSTALL_PATH/bin/conda init

    echo "--------------------------------------------------------"
    echo "✅ Anaconda installation is complete."
    echo "❗️ To use the 'conda' command in this terminal, proceed to Step 3."
    echo "--------------------------------------------------------"
    ```

4.  **Save and exit** the editor (in `nano`, press $\text{Ctrl} + \text{O}$, then $\text{Enter}$, then $\text{Ctrl} + \text{X}$).

-----

### Step 2: Run the Automated Installation

You will now execute the script to automatically install Anaconda.

1.  **Give the script permission** to run:

    ```bash
    chmod +x install_anaconda.sh
    ```

2.  **Run the script:**

    ```bash
    ./install_anaconda.sh
    ```

    The script will print its progress as it finds the file, downloads it, installs it silently to your home directory, and cleans up.

-----

### Step 3: Finalize Setup

The installer modifies your shell's configuration file (`~/.bashrc` or `~/.zshrc`), but you must reload the file to apply the changes to your current terminal session.

1.  **Source your shell profile:**

    ```bash
    source ~/.bashrc
    # Use 'source ~/.zshrc' if you are using the Zsh shell
    ```

    You should now see **`(base)`** at the start of your command prompt.

2.  **(Optional, Recommended) Disable Auto-Activation:** To prevent the `(base)` environment from loading every time you open a terminal, run:

    ```bash
    conda config --set auto_activate_base false
    ```

-----

### Step 4: Verification and First Environment

Use these commands to verify the installation and start working.

1.  **Verify Conda is working:**

    ```bash
    conda info
    ```

2.  **Create your first project environment** (using Python 3.11 as an example):

    ```bash
    conda create -n my_project_env python=3.11
    ```

3.  **Activate your new environment:**

    ```bash
    conda activate my_project_env
    ```

You are now ready to install packages into your isolated environment\!
