# Dotfiles

These are my dotfiles! Mine, but they can also be yours! Here's how:

### Clone The Repo

```bash
git clone https://github.com/jameskurlander/dotfiles.git
```

### Defining Zsh Environment Variables

In your home directory (`~`) create a file called `.zshenv` which defines a variable pointing to your oh-my-zsh installation path:

`export ZSH='/your/path/.oh-my-zsh'`

### Running the Setup Script

Before running the following script, I'd recommend checking out the packages listed in `homebrew/Brewfile.work` and `homebrew/Brewfile.personal`. Remove anything you're not interested in using, and any additional packages you'd like to be managed via Homebrew here.

Here's a brief overview of the tools I find most useful:
- [btop](https://github.com/aristocratos/btop) - Process monitor
- [gitmux](https://github.com/arl/gitmux) - Great for seeing your git status at a glance in the tmux status bar
- [harlequin](https://github.com/tconbeer/harlequin) - Really neat terminal-based SQL IDE so you can maintain your flow when working with databases
- [httpie](https://github.com/httpie/cli) - An HTTP client, great for testing API's (similar to PostMan)
- [lazydocker](https://github.com/jesseduffield/lazydocker) - A better way to manage docker containers than Docker Desktop
- [lazygit](https://github.com/jesseduffield/lazygit) - Invaluable for managing merge conflicts from the terminal

```bash
./script/setup.sh
```

Optionally, you can run this script with a `-p` flag to install/update any programs that you'd like to also manage on your personal computer via Homebrew like so:

```bash
./script/setup.sh -p
```

This script will do the following:
- Modify some keyboard defaults on MacOS to allow a smoother experience when navigating buffers:
    - Decrease the time for initial key repeat to trigger
    - Decrease the time for key repeats
- Install Homebrew (if it's not already installed)
- Install all of the packages I use:
    - Work: `homebrew/Brewfile.work`
    - Personal (if p flag is set): `homebrew/Brewfile.personal`
- Establish symlinks between the various package config folders in this repo and their respective, default config folder locations

Once complete, make sure you close and re-open the terminal so any changes take effect.

### Font
The lovely font that I use is called BerkeleyMono, and it's modeled after old-school terminal fonts. There's nothing quite like it, and it gives me joy every time I open my terminal. If you'd like your terminal to look exactly like mine, you can purchase a license from US Graphics Company [here](https://usgraphics.com/products/berkeley-mono)
