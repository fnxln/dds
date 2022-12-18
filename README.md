![](https://raw.githubusercontent.com/fnxln/dds/main/assets/logo.png)

# Languages:

<a href="https://github.com/fnxln/dds/blob/main/README_PT-BR.md">![Portugues](https://img.shields.io/badge/%F0%9F%87%A7%F0%9F%87%B7-Portugues-green)</a>
<a href="https://github.com/fnxln/dds/">![English](https://img.shields.io/badge/%F0%9F%87%AC%F0%9F%87%A7-English%20Version-blue)</a>

# What is this repo?

This is my personal configuration for *nixOS* using *flakes* and *home-manager* features 

# How to use?

This repository is meant for personal use, but if you want to use it, you can do it by following the steps below:

1. Install *nixOS* on your machine (https://nixos.org/download.html#nix-quick-install)

2. Clone the repository to *~/.dotfiles* on your home directory (or any other directory you want)

3. Run the following command:

```bash
nixos-rebuild switch --flake ~/.dotfiles#diarreia
```
4. (Optional) If you want to use the *home-manager* configuration, run the following command:

```bash
home-manager switch --flake ~/.dotfiles#diarreia
```

5. Ejoy! :D

| oi | Caganeira |
| - | - |
