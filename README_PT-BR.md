![](https://raw.githubusercontent.com/fnxln/dds/main/assets/logo.png)

# Languages:

<a href="https://google.com">![](https://img.shields.io/badge/%F0%9F%87%A7%F0%9F%87%B7-Versao%20Em%20Portugues-green)</a>
<a href="https://google.com">![](https://img.shields.io/badge/%F0%9F%87%AC%F0%9F%87%A7-English%20Version-blue)</a>

# O que é esse repositório? 

Essas são minhas configurações pessoais para o *nixOS* usando as funcionalidades do *flakes* e *home-manager*


# Como usar?

Esse repositório é destinado ao uso pessoal, mas se você quiser usá-lo, pode fazê-lo seguindo os passos abaixo:

1. Instale o *nixOS* na sua máquina (https://nixos.org/download.html#nix-quick-install)

2. Clone o repositório para *~/.dotfiles* no seu diretório home (ou qualquer outro diretório que você queira)

3. Execute o seguinte comando:

```bash
nixos-rebuild switch --flake ~/.dotfiles#diarreia
```

4. (Opcional) Se você quiser usar a configuração do *home-manager*, execute o seguinte comando:

```bash
home-manager switch --flake ~/.dotfiles#diarreia
```

5. Aproveite! :D