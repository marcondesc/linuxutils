#!/bin/bash
# Pós Instalação do Ubuntu
#

check_root_user() {
    if [ "$(id -u)" != 0 ]; then
        echo 'Please run the script as root!'
        echo 'We need to do administrative tasks'
        exit
    fi
}

# Atualizar o sistema
atualizar_sistema(){

    echo -e "
    \e[32m#############################
      Updating system...
    \e[0m
    "

    sudo apt update
    sudo apt upgrade -y

    echo "done!"
}

# Instalar Utilitários
install_utilitarios(){
    echo -e "
    \e[32m#############################
      Installing utils...
    \e[0m
    "

    apt install -y evince file-roller zip rar unrar net-tools curl git unzip alacritty thunar ubuntu-restricted-extras gparted vlc gpg htop btop rsync
    sudo add-apt-repository universe -y
    sudo apt install gnome-tweaks -y
    apt install bash-completion -y
    source /etc/bash_completion
    export PATH="$PATH:/usr/sbin"


    # Adicionar o repositório do programa eza
    # Baixar e salvar a chave GPG
    sudo mkdir -p /etc/apt/keyrings
    wget -qO- https://raw.githubusercontent.com | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
    # Adiciona o PPA do fastfetch
    sudo add-apt-repository ppa:zhangsongcui3371/fastfetch -y

    sudo apt update
    # instalar o eza
    sudo apt install -y eza fastfetch

    # instala o OpenSSH e habilita o serviço
    sudo apt install openssh-server -y
    sudo systemctl enable --now ssh
    sudo systemctl status ssh

    # instala o firewall e habilita o ssh
    sudo apt install -y ufw gufw
    sudo ufw status # Para verificar o status
    sudo ufw allow ssh # Para permitir a porta 22

    # Instalar Zed (flatpak)
    flatpak install -y flathub dev.zed.Zed
    flatpak install -y flathub com.visualstudio.code
    flatpak install -y flathub com.sublimehq.SublimeText
    flatpak install -y flathub com.vivaldi.Vivaldi

    echo "done!"
}


main() {
    check_root_user
    atualizar_sistema
    install_utilitarios

    sudo apt clean -y
    sudo apt autoremove -y
    echo "done!"
}

main
