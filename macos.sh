sudo apt update
#Installation curl git et rsync
sudo apt install curl git rsync
#Ajouter Flathub repo en premier
# Installer Flatseal
flatpak install flathub com.github.tchx84.Flatseal
#Comportement de l'espace de travail => Ajouter effets de Bureau :
    #Inverser
    #Contraste de l'arrière-plan
    #Flou
    #Transulidité
    #Réglage inactif
    #Glisser vers l'arrière

#Gestion des fenêtres 
    # Comportement des fenêtres 
        # Avancé
            # Placement des fenêtre => Centrée
    #Sélecteur de tâches
        # Large Icon
    #Scripts pour KWin
        #Obtenir de nouveaux Script
            #Force Blur => forceblur-0.6.1.kwinscript
            #Force Decorations for GTK+ 3
            #Truely Maximized
    #Puis appliquer les scripts installés

# Telechargement des ressources
https://www.pling.com/p/2062884

# Installation Plasma et GTK Theme
cd ~/Downloads && git clone https://github.com/vinceliuice/MacSonoma-kde.git && cd MacSonoma-kde/
./install.sh --round

cd ~/Downloads && git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git && cd WhiteSur-gtk-theme

#Installation Lightly et Kvantum Applications Style
    #Lightly
    sudo apt install cmake build-essential libkf5config-dev libkdecorations2-dev libqt5x11extras5-dev qtdeclarative5-dev extra-cmake-modules libkf5guiaddons-dev libkf5configwidgets-dev libkf5windowsystem-dev libkf5coreaddons-dev libkf5iconthemes-dev gettext qt3d5-dev
    git clone --single-branch --depth=1 https://github.com/Luwx/Lightly.git
    cd Lightly && mkdir build && cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_TESTING=OFF ..
    make
    sudo make install
    #Kvantum
    sudo apt install qt5-style-kvantum

# Installation icon et cursor theme

cd ~/Downloads && git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git && cd WhiteSur-icon-theme/
./install.sh -a

cd ~/Downloads && git clone https://github.com/vinceliuice/WhiteSur-cursors.git && cd WhiteSur-icon-theme/
./install.sh

#Installation Fonts et Wallpapers
cd ~/Downloads
unzip fonts.zip -d ~/.local/share/
unzip wallpapers.zip -d ~/.local/share/ # Replace : A

#Appliquer Theme, icons, cursors, font, wallpaper et installation SDDM

#configuration du système
    # Apparences
        #Theme globales
            #MacSonoma-Dark
        #Styles d'applications
            #Lightly
            # Configurer un style pour apolications "Gnome / GTK..." : WhiteSur-Dark-Solid
        # Style Plasma
            #MacSonoma-Dark
        # Couleurs
            #MacSonoma-Dark
        # Decorations de fenetres
            #MacSonoma-Dark
            # Boutons de la barre de titre : Le splacer comme MacOs
            # Taille de la bordure de la fenêtre : Pas de bordures
        # Polices
            # Ajouter toutes les polices : SF Pro Display | regular  | 10
            # Police à chasse fixe : FiraCode Nerd Font Mono | Regular | 10
        # Icones
            #MacSonoma-Dark
        # Pointeurs
            #MacSonoma-Dark
        # Ecrans de demarrage
            #MacSonoma-Dark
    
    #Comportement Général
        #Verrouillage de l'écran
            # Apparence : MacSonoma-Dark
    # SSDM
    cd ~/Downloads/MacSonoma-kde/sddm
    ./install.sh
    #Démarrage et arrêt
        #MacSonoma-Dark

#Installation plasmoids widgets et configuraiton top panel
    #Installing Windows apppmenu applet
unzip ~/Downloads/plasmoids.zip -d ~/Downloads/
rsync -av ~/Downloads/plasmoids/.local/ ~
ls -al /.local/share/plasma/plasmoids

cd ~/Downloads && git clone https://github.com/psifidotos/applet-window-appmenu.git && cd applet-window-appmenu/
sudo apt install make cmake extra-cmake-modules qtdeclarative5-dev libkf5plasma-dev libqt5x11extras5-dev g++ libsm-dev libkf5configwidgets-dev libkdecorations2-dev libxcb-randr0-dev libkf5wayland-dev plasma-workspace-dev
./install.sh
    #Installing Window Title applet
cd ~/Downloads && git clone https://github.com/psifidotos/applet-window-title.git && cd applet-window-title/
kpackagetool5 -i .

    #Installing Window Buttons Appplet
cd ~/Downloads && git clone https://github.com/psifidotos/applet-window-buttons.git && cd applet-window-buttons/
sudo apt install g++ extra-cmake-modules qtbase5-dev qtdeclarative5-dev libkf5declarative-dev libkf5plasma-dev libkdecorations2-dev gettext
./install.sh
    #Configure Top Panel
unzip ~/Downloads/top-panel.zip -d ~/Downloads/
kquitapp5 plasmashell
mv ~/.config/plasma-org.kde.plasma.desktop-appletsrc ~/.config/plasma-org.kde.plasma.desktop-appletsrc-00
cp ~/Downloads/top-panel/plasma-org.kde.plasma.desktop-appletsrc ~/.config/
kstart5 plasmashell

#Install and configure Latte Dock
sudo apt install latte-dock 

unzip ~/Downloads/latte-dock-layout.zip -d ~/Downloads/
cp -r ~/Downloads/latte-dock-layout ~/.local/share/icons/
    #Dispositions
        #Modifier les dispositions
            #Importer depuis un fichier local : ~/Downloads//latte-dock-layout/MacOs_Dock

# Install Albert Launcher
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/Debian_12/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
curl -fsSL https://download.opensuse.org/repositories/home:manuelschneid3r/Debian_12/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_manuelschneid3r.gpg > /dev/null
sudo apt update
sudo apt install albert
    #Albert Settings
        #Autostart : Checked
unzip ~/Downloads/albert-theme-macos.zip -d ~/Downloads
sudo cp -Rv ~/Downloads/albert_theme_macos/*.qss /usr/share/albert/widgetsboxmodel/themes/