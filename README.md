# Ubuntu 18.04/20.04 setup

### Most important settings
Check "Ubuntu on Wayland" option before login, and restart   
   
Open `Terminal -> Edit -> Preferences`   
-  Disable bell   
- `New tab -> Ctrl+T`  
- `Close tab -> Ctrl+W` 
- `Close window -> Ctrl+Q`
- `Copy shortcut -> Ctrl+Shift+C`
- `Paste shortcut -> Ctrl+V`
- `Disable "Use system colors set"`
   
Open `Settings -> Devices -> Keyboard -> Add shortcut`: 
- name: `open terminal` 
- command: `gnome-terminal --maximize -e tmux` 
- shortcut: `WIN+Enter`
   
Open Settings -> Universal Access -> Repeat Keys:   
- Delay: a little bit   
- Speed: about 50%   
  
### Dual-booting with Windows
Fix Windows/Linux dual boot time problem
```bash
timedatectl set-local-rtc 1 --adjust-system-clock
```
    
### Chaning login screen apperance
Download my wallpaper and save at `~/Pictures/wallpaper.jpg`     
https://drive.google.com/file/d/1d70qhHiSogltAjQFXmVq2D9EvT14hL8f/view

Edit GRUB colors
```bash
sudo nano /usr/share/plymouth/themes/default.grub
# if background_color 0,0,0,0; then
#  clear
# fi

sudo update-grub
```

Change login screen image
- Open `/usr/share/gnome-shell/theme/ubuntu.css`
- Find
```
#lockDialogGroup {
  background: #2c001e url(resource:///org/gnome/shell/theme/noise-texture.png);
  background-repeat: repeat; 
 }
```
- Change it to
```
#lockDialogGroup {
  background: #2c001e url(file:///home/michal/Pictures/wallpaper.jpg);
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center;
}
```
    
### Software
Install my regular stuff
```bash
sudo apt update
sudo apt upgrade

# command line stuff
sudo apt install zsh \
                 git \
                 curl \
                 wget \
                 vim \
                 nano \
                 tree \
                 jq \
                 libxml2-utils \
                 dnsutils \
                 traceroute \
                 netcat \
                 nmap \
                 net-tools \
                 htop \
                 neofetch \
                 screen \
                 tmux \
                 unrar \
                 p7zip-full \
                 liblz4-tool \
                 build-essential \
                 apt-transport-https \
                 ca-certificates \
                 libmpc-dev \
                 attr \
                 binwalk \
                 john \
                 hashcat \
                 hashcash \
                 volatility

# GUI stuff         
sudo apt install vim-gtk3 \
                 evolution \
                 chromium-browser \
                 gnome-tweak-tool \
                 wireshark \
                 gimp \
                 virt-manager \
                 radare2 \
                 bless \
                 ffmpeg \
                 libavcodec-extra \
                 audacity \
                 vlc \
                 obs-studio \
                 gocr

sudo snap install 1password-linux
sudo snap install --classic code
```
   
Install Docker
```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
```

Install Java
```bash
wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
sudo apt update
sudo apt install adoptopenjdk-8-hotspot adoptopenjdk-11-hotspot 

sudo update-alternatives --config java  # choose adoptopenjdk-8-hotspot as default
```

Install Spotify
```bash
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client
```

Install Sublime
```bash
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-add-repository "deb https://download.sublimetext.com/ apt/stable/"
sudo apt install sublime-text
```

Install Idea
```bash
# Download tar from website https://www.jetbrains.com/idea/download/#section=linux
# Assuming version 201.7223.91

tar -xzf ideaIC-2020.1.1.tar.gz
sudo mv idea-IC-201.7223.91 /opt
rm -f ideaIC-2020.1.1.tar.gz
sudo chown -R michal:michal /opt/idea-IC-201.7223.91
/opt/idea-IC-201.7223.91/bin/idea.sh 
```

### Terminal stuff
Install oh-my-zsh
```bash
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" -s --batch
```

Install fzf
```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

Install my personal scripts:
```bash
git clone https://github.com/mkorman9/scripts
```

Create my workspace folder
```bash
mkdir -p ~/workspace && cd ~/workspace
```

### Essential tweaking
Open `Tweaks`:   
- `Appearance -> Themes -> Adawaita-dark` 
- `Keyboard & Mouse -> Additional Layout Options -> Caps lock behavior -> Make additional ESC`   
- `Top Bar -> Clock -> Date`   
    
OS-level keybinds and settings
 ```bash
gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature 4500
gsettings set org.gnome.shell.app-switcher current-workspace-only true
gsettings set org.gnome.nautilus.desktop volumes-visible 'false'
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['']"
gsettings set org.gnome.desktop.wm.keybindings begin-move "['']"
gsettings set org.gnome.desktop.wm.keybindings begin-resize "['']"
```

 ### Generating ssh key
```bash
ssh-keygen -t rsa -b 4096 -C "michal.korman@icloud.com" -q -N "" -f ~/.ssh/id_rsa
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
```
   
Upload generated key to github and gitlab

### Python stuff
Create a folder for global virtual envs
```bash
mkdir ~/.virtualenvs
```

Install Python 3.8
```bash
# Both Ubuntu 18.04 and 20.04
sudo apt install python3.8 python3.8-venv python3.8-dev python3-venv
python3.8 -m venv ~/.virtualenvs/common_py3
```

Install Python 2.7
```bash
# Ubuntu 18.04
sudo apt install python python-virtualenv python-dev
python2 -m virtualenv ~/.virtualenvs/common_py27

# Ubuntu 20.04
sudo apt install python2
wget -O /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py
python2 /tmp/get-pip.py
python2 -m pip install virtualenv
python2 -m virtualenv ~/.virtualenvs/common_py27
```

Install essential modules
```bash
# For both environments
pip install boto \
    ipython \
    numpy \
    matplotlib \
    paramiko \
    Pillow \
    pudb \
    pwntools \
    pycrypto \
    pyserial \
    requests \
    z3-solver \
    flask
```
   
Configure IPython to stop asking annoying questions
```bash
ipython profile create
sed -i 's/# c.TerminalInteractiveShell.confirm_exit = True/c.TerminalInteractiveShell.confirm_exit = False/g' ~/.ipython/profile_default/ipython_config.py
```

### JavaScript stuff
```bash
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install -y nodejs
```

### Hacking stuff
SeLists
```bash
git clone git@github.com:danielmiessler/SecLists.git
```

ffuf
```bash
wget https://github.com/ffuf/ffuf/releases/download/v1.0.2/ffuf_1.0.2_linux_amd64.tar.gz && \
    tar -zxvf ffuf_1.0.2_linux_amd64.tar.gz ffuf && \
    rm ffuf_1.0.2_linux_amd64.tar.gz && \
    sudo mv ffuf /usr/local/bin
```
    
gitdumper
```bash
sudo wget -P /usr/local/bin https://raw.githubusercontent.com/internetwache/GitTools/master/Dumper/gitdumper.sh && \
    sudo chmod a+x /usr/local/bin/gitdumper.sh
```

Burp
* Download Burp Community from https://portswigger.net/burp/communitydownload and save into /opt
* `chmod 400 /opt/burpsuite_community_v2020.4.jar`
* Start Burp
* Start Chromium (`chromium-browser --proxy-server="127.0.0.1:8080"`), navigate to `burp/` and download CA cert
* Go to Settings -> Manage Certificates -> Authorities -> Import and choose the downloaded CA cert
* Trust this certificate

### Shell configuration

`.zshrc`

### Git configuration:

`.gitconfig`

### tmux settings

`.tmux.conf`

### Sublime settings:

`./sublime/`

### VSCode settings

`./vscode/`
