## A Fresh macOS Setup

These instructions are for setting up new Mac devices.

### Setting up your Mac

After backing up your old Mac you may now follow these install instructions to setup a new one.

1. Update macOS to the latest version through system preferences
2. Make sure git is installed by running the `git` command in your terminal

3. Clone this repo to `~/.dotfiles` with:

    ```zsh
    git clone --recursive git@github.com:SamuelNitsche/dotfiles.git ~/.dotfiles
    ```

4. Run the installation with:

    ```zsh
    cd ~/.dotfiles && ./fresh.sh
    ```

5. Start `Herd.app` and run its install process
6. Restart your computer to finalize the process

Your Mac is now ready to use!
