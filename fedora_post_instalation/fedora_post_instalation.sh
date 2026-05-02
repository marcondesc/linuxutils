#!/usr/bin/env bash

# --- Configurações Iniciais ---
set -e

echo "🚀 Iniciando a pós-instalação turbo V3 (Fedora Edition)..."

# 1. Otimização do DNF e atualização
echo "📥 Otimizando o DNF e atualizando o sistema..."
# Adiciona configurações de velocidade ao dnf.conf se não existirem
if ! grep -q "max_parallel_downloads" /etc/dnf/dnf.conf; then
    echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf
    echo 'fastestmirror=True' | sudo tee -a /etc/dnf/dnf.conf
fi

sudo dnf upgrade -y

# 2. Adição de Repositórios de Terceiros
echo "📦 Configurando repositórios externos..."

# RPM Fusion (Essencial para Codecs e VLC)
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
                    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Instalando Gnome tweaks
sudo dnf install gnome-tweaks

# VS Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo
sudo dnf check-update
sudo dnf install -y code

# Vivaldi
sudo rpm --import https://repo.vivaldi.com/archive/linux_signing_key.pub
sudo dnf config-manager --add-repo https://repo.vivaldi.com/archive/vivaldi-fedora.repo
sudo dnf install -y vivaldi-stable



# Vivaldi e Sublime Text
sudo dnf config-manager --add-repo https://repo.vivaldi.com/archive/vivaldi-fedora.repo
sudo rpm --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

# Albert (Alternativa superior ao Ulauncher - via COPR)
sudo dnf copr enable alexpl/albert -y

# 3. Instalação de Pacotes via DNF
echo "🛠️ Instalando ferramentas, editores e utilitários..."
sudo dnf install -y \
    evince file-roller zip rar unrar unzip \
    net-tools curl git eza alacritty thunar fastfetch \
    #vivaldi-stable code sublime-text \
    vlc rsync gparted albert openssh-server flatpak \
    dnf-plugins-core

# 4. Configuração do SSH
echo "🔑 Habilitando o OpenSSH Server..."
sudo systemctl enable --now sshd
# Garante que o firewall permita o tráfego SSH
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --reload

# 5. Configuração do Flatpak
echo "💎 Adicionando Flathub..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# 6. Instalação de Codecs de Multimídia (O "Fedora Way")
echo "🎬 Instalando codecs de mídia..."
sudo dnf groupupdate -y multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-libav lame\* --exclude=lame-devel

# 7. Zed Editor (Via script oficial)
echo "⌨️ Instalando Zed Editor..."
curl -f https://zed.dev/install.sh | sh

# 8. Limpeza Final
echo "🧹 Limpando o sistema..."
sudo dnf autoremove -y
sudo dnf clean all

echo "---"
echo "✅ Pós-instalação finalizada com sucesso!"
echo "💡 Albert instalado: Pressione Alt+Space (ou configure o atalho) para iniciar."
echo "📡 SSH Ativo: Você já pode se conectar remotamente nesta máquina."
echo "🔄 Sugestão: Reinicie o sistema para carregar todos os novos codecs e drivers."
