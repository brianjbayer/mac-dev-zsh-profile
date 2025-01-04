# mac-dev-zsh-profile

Contains a basic `.zshrc` "Z shell" user profile
for (Ruby/Rails, Node) development.

* Assumes and enables...
  * Homebrew
  * [nvm](https://github.com/nvm-sh/nvm) (commented out)

---

## How to Install
Here you will run a curl command to download the install script
which will download the current default-branch version of
the `.zshrc` in this project into a (created) `[username]-profile`
directory and softlink it to `~/.zshrc`.

1. In a terminal, change directory to the `/tmp` directory
   ```bash
   cd /tmp
   ```

2. Run the following command to download the installation script
   ```bash
   curl --location --remote-header-name \
     --remote-name "https://raw.githubusercontent.com/brianjbayer/mac-dev-zsh-profile/main/install-mac-dev-zsh-profile"
   ```

3. Make the installation script executable
   ```bash
   chmod u+x install-mac-dev-zsh-profile
   ```

4. Run the installation script
   ```bash
   ./install-mac-dev-zsh-profile
   ```

   :fast_forward: To also install the default `~/.alias` file
   ```bash
   ./install-mac-dev-zsh-profile -a
   ```

   :hammer: To force the installation and overwrite any existing files
   ```bash
   ./install-mac-dev-zsh-profile -f
   ```
