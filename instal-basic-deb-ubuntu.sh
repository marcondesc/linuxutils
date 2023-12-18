#!/bin/bash

# Defining Colors for text output
red=$( tput setaf 1 );
yellow=$( tput setaf 3 );
green=$( tput setaf 2 );
normal=$( tput sgr 0 );

# Defining Header
HEADER="
Marcondes Cunha - 2023
Script para instalar, atualizar distros Debian, Ubuntu etc.
This program comes with ABSOLUTELY NO WARRANTY
"

mostrar_menu_programas() {
    echo "Escolha um programa para instalar:"
    echo "1) git"
    echo "2) nano"
    echo "3) vim"
    echo "4) curl"
    echo "5) htop"
    echo "6) evince (leitor de PDF)"
    echo "7) file-roller"
    echo "8) zip"
    echo "9) rar"
    echo "10) unrar"
    echo "11) epiphany-browser"
    echo "12) menulibre"
    echo "13) celluloid (player de video)"
    echo "14) plank (doca)"
    echo "15) net-tools"
    echo "16) git-cola"
    echo "17) Sair e voltar ao menu anterior"

    # Ler a escolha do usuário
    read -p "Digite o número da sua escolha: " escolha

    case $escolha in
    1) 
        atualizar_pacotes
        instalar_programa "git"
        ;;
    2)
        atualizar_pacotes
        instalar_programa "nano"
        ;;
    3)
        atualizar_pacotes
        instalar_programa "vim"
        ;;
    4)
        atualizar_pacotes
        instalar_programa "curl"
        ;;
    5)
        atualizar_pacotes
        instalar_programa "htop"
        ;;
    6)
        atualizar_pacotes
        instalar_programa "evince"
        ;;
    7)
        atualizar_pacotes
        instalar_programa "file-roller"
        ;;
    8)
        atualizar_pacotes
        instalar_programa "zip"
        ;;
    9)
        atualizar_pacotes
        instalar_programa "rar"
        ;;
    10)
        atualizar_pacotes
        instalar_programa "unrar"
        ;;
    11)
        atualizar_pacotes
        instalar_programa "epiphany-browser"
        ;;
    12)
        atualizar_pacotes
        instalar_programa "menulibre"
        ;;
    13)
        atualizar_pacotes
        instalar_programa "celluloid"
        ;;
    14)
        atualizar_pacotes
        instalar_programa "plank"
        ;;
    15)
        atualizar_pacotes
        instalar_programa "net-tools"
        ;;
    16)
        atualizar_pacotes
        instalar_programa "git-cola"
        ;;

    17)
        echo "Saindo..."
        #exit 0
        ;;
    *)
        echo "Opção inválida. Tente novamente."
        ;;
    esac

}


# Função para instalar um programa
instalar_programa() {
    echo -e "
    \e[32m#############################
     Instalando $1 
    #############################\e[0m
    "
    sudo apt install -y $1
    if [ $? -eq 0 ]; then
        echo "${green}$1 instalado com sucesso!${normal}"
    else
        #echo "Falha ao instalar $1. Abortando o script."
        echo "${red}Falha ao instalar $1. Abortando o script.${normal}"
        exit 1
    fi
}


instalar_brave(){
    echo -e "
        \e[32m#############################
        Instalando Brave Browser
        #############################\e[0m
        "
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

    sudo apt update

    sudo apt install brave-browser -y
}


atualizar_sistema(){
    echo -e "
    \e[32m#############################
    #     Updating Data Base    #
    #############################\e[0m
    "
    sudo apt update

    echo -e "
    \e[32m##############################
    # Upgrading Operating System #
    ##############################\e[0m
    "
    sudo apt upgrade -y

    echo -e "
    \e[32m##################################################
    # Clean up any unwanted packages from the System #
    ##################################################\e[0m
    "
    sudo apt autoremove -y

    echo -e "
    \e[32m##############################
    #   Updating Snap packages   #
    ##############################\e[0m
    "
    sudo snap refresh

    echo -e "
    \e[32m#################################
    #   Updating Flatpak packages   #
    #################################\e[0m
    "
    sudo flatpak update -y
}


atualizar_pacotes(){
    # Atualizar lista de pacotes
    echo -e "
    \e[32m#############################
    #     Updating Data Base    #
    #############################\e[0m
    "
    sudo apt update
    if [ $? -ne 0 ]; then
    echo "Falha ao atualizar a lista de pacotes. Abortando o script."
    exit 1
    fi
}

instalar_nerd_fonts(){
    # install DroidSansMono Nerd Font --> u can choose another at: https://www.nerdfonts.com/font-downloads
    echo "[-] Download fonts [-]"
    echo "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip"
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip
    unzip JetBrainsMono.zip -d ~/.fonts

    echo "[-] Download fonts [-]"
    echo "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/CascadiaCode.zip"
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/CascadiaCode.zip
    unzip CascadiaCode.zip -d ~/.fonts

    echo "[-] Download fonts [-]"
    echo "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip"
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip
    unzip FiraCode.zip -d ~/.fonts

    fc-cache -fv

    echo "[-] Removendo arquivos [-]"
    rm JetBrainsMono.zip CascadiaCode.zip FiraCode.zip

    echo "done!"
}


instalar_todos(){
    instalar_programa "git"
    instalar_programa "nano"
    instalar_programa "mousepad"
    instalar_programa "vim"
    instalar_programa "curl"
    instalar_programa "htop"
    instalar_programa "evince"
    instalar_programa "file-roller"
    instalar_programa "zip"
    instalar_programa "rar"
    instalar_programa "unrar"
    instalar_programa "epiphany-browser"
    instalar_programa "menulibre"
    instalar_programa "celluloid"
    instalar_programa "plank"
    instalar_programa "net-tools"
    instalar_programa "git-cola"
    instalar_programa "wget"
    instalar_brave
}

instalar_vscode_apt(){
    echo -e "
    \e[32m#############################
     Instalando VS Code
    #############################\e[0m
    "
    sudo apt update && sudo apt upgrade -y
    sudo apt install software-properties-common apt-transport-https wget -y
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt update
    sudo apt install code -y
}

instalar_sublime_apt(){
    echo -e "
    \e[32m#############################
     Instalando Sublime Text
    #############################\e[0m
    "
    sudo apt update && sudo apt upgrade -y
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    sudo apt-get install apt-transport-https -y
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list  
    sudo apt update
    sudo apt-get install sublime-text -y
}


# Função para mostrar o menu de opções
mostrar_menu() {
  echo "Escolha uma opção:"
  echo "1) Apenas atualizar o sistema"
  echo "2) Instalar programas essenciais"
  echo "3) Instalar pip (python)"
  echo "4) Atualizar o pip"
  echo "5) Instalar Sublime Text"
  echo "6) Instalar VS Code"
  echo "7) Sair"
}



if [[ ${UID} != 0 ]]; then
    echo "${red}
    This script must be run as root or with sudo permissions.
    Please run using sudo.${normal}
    "
    exit 1
fi

# Display HEADER
echo "${red}$HEADER${normal}"

# Loop principal
while true; do
  mostrar_menu

  # Ler a escolha do usuário
  read -p "Digite o número da sua escolha: " escolha

  case $escolha in
    1)
        atualizar_sistema
        ;;
    2)
        atualizar_pacotes
        instalar_todos
        ;;
    3)
        atualizar_pacotes
        instalar_programa "python3-pip"
        ;;
    4)
        pip install --upgrade pip
        ;;
    5)
        instalar_sublime_apt
        ;;
    6)
        instalar_vscode_apt
        ;;
    7)
        echo "Saindo..."
        exit 0
        ;;
    *)
        echo "Opção inválida. Tente novamente."
        ;;
  esac
done

