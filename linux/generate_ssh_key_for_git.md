## Secure Git Operations with SSH Keys

Using an SSH key is the most secure way to authenticate and interact with remote Git repositories like GitLab, GitHub, or Bitbucket. This process involves generating a local key pair and adding the public key to your Git hosting service.

### Step 1: Generate an SSH Key Pair

Open your terminal and run the following command, replacing the example email with your own. This command generates a new SSH key using the **Ed25519** algorithm (modern and secure) and saves it to the default location (`~/.ssh/id_ed25519`).

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

  * When prompted to "Enter a file in which to save the key," press **Enter** to accept the default.
  * It is highly recommended to **set a strong passphrase** when prompted.

### Step 2: Start the SSH Agent and Add the Key

The SSH agent manages your keys and holds your decrypted passphrase, so you don't have to enter it for every Git operation.

1.  **Start the agent** (if it's not already running):
    ```bash
    eval "$(ssh-agent -s)"
    ```
2.  **Add your private key** to the agent:
    ```bash
    ssh-add ~/.ssh/id_ed25519
    ```

### Step 3: Copy Your Public Key

Your **public key** (`id_ed25519.pub`) is what you'll add to your Git account. Display the content of this file:

```bash
cat ~/.ssh/id_ed25519.pub
```

Copy the entire output (it typically starts with `ssh-ed25519` and ends with your email).

### Step 4: Add the Public Key to Your Git Service

1.  Log in to your Git hosting service (e.g., GitLab, GitHub, Bitbucket).
2.  Navigate to your **User Settings** $\rightarrow$ **SSH Keys** section.
3.  Paste the public key you copied in Step 3 into the key field and save it.

You can now use SSH URLs (e.g., `git@gitlab.com:user/repo.git`) for cloning and pushing to your repositories.

### Further Reading

  * **GitHub Documentation:** [https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
  * **Atlassian/Git SSH Tutorial:** [https://www.atlassian.com/git/tutorials/git-ssh](https://www.atlassian.com/git/tutorials/git-ssh)
  * **W3Docs Git SSH Guide:** [https://www.w3docs.com/snippets/git/how-to-generate-ssh-key-for-git.html](https://www.w3docs.com/snippets/git/how-to-generate-ssh-key-for-git.html)
