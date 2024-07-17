# Why?

I'm managing my dotfiles with [Chezmoi](https://www.chezmoi.io) now, yay!

Why am I doing this though?
- Someone I think is cool uses it
- I want to learn a new way of working with my dotfiles
- It seems more flexible when it comes to templates and encryption than yadm, my old dotfiles manager

# Setup on a new machine

## Install and init

Install `chezmoi` to `~/.local/bin` if you haven't already.

```
sh -c "$(curl -fsLS get.chezmoi.io/lb)"
```

Initialize it, which will set up `~/.config/chezmoi/chezmoi.toml`.

```
chezmoi init almondheil
```

## Set chezmoi data and apply

Edit the file `~/.config/chezmoi/chezmoi.toml`. At the top under the `[data]` heading,
change the variables to match the machine you're on.

When you are done, apply the changes to your system. This will also prompt for the encryption
key used to protect the sensitive files in the repo.

```
chezmoi apply
```

## Switch to SSH 

Go to the chezmoi directory and update the remote URL to use SSH instead.

Then, exit the shell `chezmoi cd` creates.

```
chezmoi cd
git remote set-url origin git@github.com:almondheil/dotfiles.git
exit
```
