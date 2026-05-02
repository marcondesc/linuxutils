#!/bin/bash

# Debullshit Ubuntu
# https://github.com/polhdez/ubuntu-debullshit

# check_root_user() {
#     if [ "$(id -u)" != 0 ]; then
#         echo 'Please run the script as root!'
#         echo 'We need to do administrative tasks'
#         exit
#     fi
# }

# Pós Instalação do Ubuntu

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

    apt install -y evince file-roller zip rar unrar net-tools curl git unzip
    apt install bash-completion -y
    source /etc/bash_completion
    export PATH="$PATH:/usr/sbin"

    echo "done!"
}

# Instalar o git
install_git(){
    echo -e "
    \e[32m#############################
      Installing Git...
    \e[0m
    "
    sudo apt install git -y

    # configure git
    # git config --global user.name "Your Name"
    # git config --global user.email "your.email@example.com"

    echo "done!"
}

# Instalar o programa eza
install_eza(){
# O eza é uma alternativa moderna e colorida ao comando tradicional ls no Linux.
# Para instalar o eza no Ubuntu (especialmente nas versões 22.04 e 24.04),
# a forma mais recomendada é utilizando o repositório oficial do projeto.

    echo -e "
    \e[32m#############################
      Installing eza...
    \e[0m
    "
    # instalar o GPG
    sudo apt install -y gpg
    # Baixar e salvar a chave GPG
    sudo mkdir -p /etc/apt/keyrings
    wget -qO- https://raw.githubusercontent.com | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
    # Adicionar o repositório ao sources.list
    echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
    # atualizar o sistema para pegar a fonte do pacote eza
    sudo apt update
    # instalar o eza
    sudo apt install -y eza

    # Configurar o eza no .bashrc
    #echo "# Marcondes Cunha" >> ~/.bashrc
    #echo "alias ls='eza -lh --group-directories-first --icons=auto'" >> ~/.bashrc
    #echo "alias la='eza -lha --group-directories-first --icons=auto'" >> ~/.bashrc
    #source ~/.bashrc

    echo "done!"
}

configurar_eza(){
  # Configurar o eza no .bashrc
  echo "# Marcondes Cunha" >> ~/.bashrc
  echo "alias ls='eza -lh --group-directories-first --icons=auto'" >> ~/.bashrc
  echo "alias la='eza -lha --group-directories-first --icons=auto'" >> ~/.bashrc
  source ~/.bashrc
}

# Instalar o terminal Alacritty
install_alacritty(){
    echo -e "
    \e[32m#############################
      Installing Alacritty...
    \e[0m
    "
    sudo apt install alacritty -y

    # Copiar o arquivo de configuração do Alacrity
    cp alacritty_toml_source.txt ~/.alacritty.toml

    echo "done!"
}

# Instalar o programa Nautilus (se estiver no Pop OS, acho que no Ubuntu já vem)

# Instalar o programa Thunar
install_thunar(){
    echo -e "
    \e[32m#############################
      Installing Thunar...
    \e[0m
    "
    sudo apt install thunar -y

    echo "done!"
}

# Instalar o browser Vivaldi
install_vivaldi(){
    echo -e "
    \e[32m#############################
      Installing Vivaldi...
    \e[0m
    "
    #  flatpak install flathub com.vivaldi.Vivaldi
    # 1. Download the latest stable .deb package (adjust version if needed)
    wget https://downloads.vivaldi.com/stable/vivaldi-stable_amd64.deb

    # 2. Install the package (using apt is often better for dependency resolution)
    sudo apt install ./vivaldi-stable_amd64.deb -y

    # 3. Remove downloaded .deb file
    rm ./vivaldi-stable_amd64.deb

    echo "done!"
}

# Instalar Zed (flatpak)
# flatpak install flathub dev.zed.Zed

# Instalar Sublime Text
install_sublimetext(){
    echo -e "
    \e[32m#############################
      Installing Sublime Text...
    \e[0m
    "
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo tee /etc/apt/keyrings/sublimehq-pub.asc > /dev/null
    echo -e 'Types: deb\nURIs: https://download.sublimetext.com/\nSuites: apt/stable/\nSigned-By: /etc/apt/keyrings/sublimehq-pub.asc' | sudo tee /etc/apt/sources.list.d/sublime-text.sources
    sudo apt-get update
    sudo apt-get install sublime-text -y

    echo "done!"
}

# Instalar o VS Code
install_vscode(){
    echo -e "
    \e[32m#############################
      Installing Visual Studio Code...
    \e[0m
    "
    #sudo apt install software-properties-common apt-transport-https wget -y
    #wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo tee /usr/share/keyrings/vscode.gpg > /dev/null
    #echo deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main | sudo tee /etc/apt/sources.list.d/vscode.list
    #sudo apt update
    #sudo apt install code -y

    # Trecho retirado do script do Linux Toys
    # sudo curl -fsSLo /usr/share/keyrings/vscode-keyring.asc https://packages.microsoft.com/keys/microsoft.asc
    # echo "deb [signed-by=/usr/share/keyrings/vscode-keyring.asc arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
    # sleep 1
    # sudo apt update
    # sudo apt install code -y

    # Trecho retirado do script do Omakub
    if [ ! -f /etc/apt/keyrings/packages.microsoft.gpg ] || [ ! -f /usr/share/keyrings/microsoft.gpg ]; then
      [ -f /etc/apt/keyrings/packages.microsoft.gpg ] && sudo rm /etc/apt/keyrings/packages.microsoft.gpg
      cd /tmp
      wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
      sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
      echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null
      rm -f packages.microsoft.gpg
      cd -
    fi

    sudo apt update
    sudo apt install -y code

    # Install Nord Theme
    code --install-extension arcticicestudio.nord-visual-studio-code

    echo "done!"
}

# Instalar fontes Microsoft
install_fonts(){

    username=$0

    # '/home/./ubuntu-post-instalation.sh/.local/share/fonts'
    cd /home/$username
    mkdir -p .local/share/fonts

    cd /tmp

    echo -e "
    \e[32m#############################
      Installing Microsoft Fonts...
    \e[0m
    "
    # Instala a fonte Cascadia Code da Microsoft
    # https://github.com/microsoft/cascadia-code/releases/download/v2407.24/CascadiaCode-2407.24.zip

    wget https://github.com/microsoft/cascadia-code/releases/download/v2407.24/CascadiaCode-2407.24.zip
    unzip CascadiaCode-2407.24.zip -d CascadiaCode
    cp CascadiaCode/ttf/*.ttf /home/$username/.local/share/fonts
    rm -rf CascadiaCode-2407.24.zip CascadiaCode

    sudo apt install ttf-mscorefonts-installer -y

    echo "done!"

    echo -e "
    \e[32m#############################
      Installing Nice Fonts...
    \e[0m
    "

    wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip
    unzip CascadiaMono.zip -d CascadiaFont
    cp CascadiaFont/*.ttf /home/$username/.local/share/fonts
    rm -rf CascadiaMono.zip CascadiaFont

    wget -O iafonts.zip https://github.com/iaolo/iA-Fonts/archive/refs/heads/master.zip
    unzip iafonts.zip -d iaFonts
    cp iaFonts/iA-Fonts-master/iA\ Writer\ Mono/Static/iAWriterMonoS-*.ttf /home/$username/.local/share/fonts
    rm -rf iafonts.zip iaFonts

    echo "done!"

    echo -e "
    \e[32m#############################
      Installing Nerdfonts...
    \e[0m
    "

    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip
    unzip JetBrainsMono.zip -d JetBrainsMono
    cp JetBrainsMono/*.ttf /home/$username/.local/share/fonts
    rm -rf JetBrainsMono.zip JetBrainsMono

    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/CodeNewRoman.zip
    unzip CodeNewRoman.zip -d CodeNewRoman
    cp CodeNewRoman/*.ttf /home/$username/.local/share/fonts
    rm -rf CodeNewRoman.zip CodeNewRoman

    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip
    unzip FiraCode.zip -d FiraCode
    cp FiraCode/*.ttf /home/$username/.local/share/fonts
    rm -rf FiraCode.zip FiraCode

    fc-cache
    cd -

    echo "done!"
}

# Install Multimedia Codecs: Install codecs for MP3, MKV, etc., often with
install_codecs(){
    echo -e "
    \e[32m#############################
      Installing Multimedia Codecs...
    \e[0m
    "
    sudo apt install ubuntu-restricted-extras -y

    echo "done!"
}

# Install gnome-tweaks
install_tweaks(){
    echo -e "
    \e[32m#############################
      Installing Gnome Tweaks...
    \e[0m
    "
    sudo add-apt-repository universe -y
    sudo apt install gnome-tweaks -y
    # comando para resetar as configurações do gnome tweaks para o padrão "de fábrica"
    # dconf reset -f /

    # instalar extensão
    # sudo apt install gnome-browser-connector -y

    echo "done!"
}

# Instalar gerenciadores de tarefas
install_gerenciadores_tarefas(){
    echo -e "
    \e[32m#############################
      Installing htop, btop...
    \e[0m
    "
    sudo apt install -y htop btop

    echo "done!"
}

# Instalar fastfetch
install_fastfetch(){
    echo -e "
    \e[32m#############################
      Installing fastfetch...
    \e[0m
    "

    # 1. Adiciona o PPA do fastfetch
    sudo add-apt-repository ppa:zhangsongcui3371/fastfetch -y

    # 2. Atualiza a lista de pacotes
    sudo apt update

    # 3. Instala o fastfetch
    sudo apt install fastfetch -y

    echo "done!"
}

# Instalar vlc
install_vlc(){
    echo -e "
    \e[32m#############################
      Installing VLC...
    \e[0m
    "
    sudo apt install -y vlc

    echo "done!"
}

# Instalar gparted
install_gparted(){
    echo -e "
    \e[32m#############################
      Installing Gparted...
    \e[0m
    "
    sudo apt install -y gparted

    echo "done!"
}

# Instalar ssh e rsync
install_ssh(){
    echo -e "
    \e[32m#############################
      Installing SSH...
    \e[0m
    "
    # instala o ssh e habilita o serviço
    sudo apt install openssh-server -y
    sudo systemctl enable --now ssh
    sudo systemctl status ssh

    # instala o firewall e habilita o ssh
    sudo apt install -y ufw gufw
    sudo ufw status # Para verificar o status
    sudo ufw allow ssh # Para permitir a porta 22

    # instala o rsync
    sudo apt install rsync -y

    echo "done!"
}

# Instalar ULauncher
install_ulauncher(){
    echo -e "
    \e[32m#############################
      Installing ULauncher...
    \e[0m
    "
    sudo add-apt-repository universe -y
    sudo add-apt-repository ppa:agornostal/ulauncher -y
    sudo apt update
    sudo apt install ulauncher -y

    # Start ulauncher to have it populate config before we overwrite
    mkdir -p ~/.config/autostart/
    #cp ~/.local/share/omakub/configs/ulauncher.desktop ~/.config/autostart/ulauncher.desktop
    gtk-launch ulauncher.desktop >/dev/null 2>&1
    sleep 2 # ensure enough time for ulauncher to set defaults
    #cp ~/.local/share/omakub/configs/ulauncher.json ~/.config/ulauncher/settings.json

    echo "done!"
}



main() {

    meu_usuario=$USER
    echo "O usuário é: $meu_usuario"
    sleep 2

    #check_root_user
    atualizar_sistema
    install_utilitarios
    install_git
    install_eza # nao funcionou escrever no bashrc
    configurar_eza
    install_alacritty # nao funcionou a cópia do arquivo de configuracao
    install_thunar
    install_vivaldi
    install_sublimetext
    install_vscode
    install_fonts $meu_usuario # não funciona ainda a cópia dos arquivos de fonte, tenho que acertar o caminho
    install_codecs
    install_tweaks
    install_gerenciadores_tarefas
    install_fastfetch
    install_vlc
    install_gparted
    install_ssh
    install_ulauncher

    sudo apt clean -y
    sudo apt autoremove -y
    echo "done!"

}

main
