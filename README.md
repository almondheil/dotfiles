# Why?

I'm managing my dotfiles with [Chezmoi](https://www.chezmoi.io) now, yay!

Why am I doing this though?
- Someone I think is cool uses it
- I want to learn a new way of working with my dotfiles
- It seems more flexible when it comes to templates and encryption than yadm, my old dotfiles manager

# Cloning this repo

First, clone and apply the repo. It can all be done at once!

```
chezmoi init --apply https://github.com/almondheil/dotfiles.git
```

This will prompt for the encryption passphrase and decrypt what's needed, but
once that's done you need to go to your chezmoi git directory to change it from HTTPS to SSH.

```
chezmoi cd
git remote set-url origin git@github.com:almondheil/dotfiles.git
exit # to get out of `chezmoi cd` shell
```
