#! /bin/bash

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
echo "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/CodeNewRoman.zip"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/CodeNewRoman.zip
unzip CodeNewRoman.zip -d ~/.fonts

echo "[-] Download fonts [-]"
echo "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip
unzip FiraCode.zip -d ~/.fonts

# Instala a fonte Cascadia Code da Microsoft
# https://github.com/microsoft/cascadia-code/releases/download/v2407.24/CascadiaCode-2407.24.zip

# instala fontes da Microsoft
# sudo apt install ttf-mscorefonts-installer

fc-cache -fv

echo "[-] Removendo arquivos [-]"
rm JetBrainsMono.zip CascadiaCode.zip CodeNewRoman.zip FiraCode.zip

echo "done!"
