# https://www.debugpoint.com/10-things-to-do-fedora-39-after-install/
echo "max_parallel_downloads=10" | sudo tee /etc/dnf/dnf.conf -a
echo "fastestmirror=True" | sudo tee /etc/dnf/dnf.conf -a

# System Update
sudo dnf update -y
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf upgrade --refresh -y
sudo dnf group update core

# Fix Firefox decoder
sudo dnf install firefox -y
sudo dnf config-manager --set-enabled fedora-cisco-openh264
sudo dnf install gstreamer1-plugin-openh264 mozilla-openh264 -y

# INSTALLING ALL CODECS FOR FEDORA
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel -y
sudo dnf install lame\* --exclude=lame-devel -y
sudo dnf group upgrade --with-optional Multimedia --allowerasing -y

# INSTALL NVIDIA DRIVER https://rpmfusion.org/Howto/NVIDIA
sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda -y

# Additional Apps
sudo dnf install flatpak -y
flatpak remote-modify --enable flathub
flatpak install flathub com.google.Chrome -y
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub com.valvesoftware.Steam -y
sudo dnf install git gh htop btop neofetch neovim fzf bat exa xinput unzip p7zip p7zip-plugins unrar curl wget kitty -y

# Gnome Setting
#gsettings set org.gnome.mutter auto-maximize false
#flatpak install flathub com.mattjakeman.ExtensionManager -y
#sudo dnf install gnome-tweak-tool -y

# Nerd Font
#wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/SourceCodePro.zip
mkdir ~/.fonts
cp -r ../fonts/SourceCodePro/ ~/.fonts/
cp -r ../fonts/Noto_Sans_Thai_Looped/ ~/.fonts/
fc-cache -f -v

# Starship
curl -sS https://starship.rs/install.sh | sh
starship preset gruvbox-rainbow -o ~/.config/starship.toml

# Copy config files
cp ../dot-files/.bashrc ~/
cp -r ../config-files/kitty/ ~/.config/
cp .sync-conf.sh ~/
#cp -r ../config-files/neofetch/ ~/.config/

# NVChad
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
