{ pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
      
      # Web
      firefox
      brave
        
      # Terminal & Tools
      alacritty
      neofetch
      nitch
      neovim
      git
      gh
      home-manager
      usbutils
      pciutils
      toybox
      busybox
      ollama
      udev
      wirelesstools
      pulseaudioFull
      playerctl
      easyeffects
      acpilight
      pamixer


      # Monitoring
      btop
      powertop
      stacer 

      # Desktop
      dmenu
      rofi
      polybar
      nitrogen
      picom-jonaburg

      # Media
      feh
#      vlc
      mpv

      #Art & CAD 
      inkscape
      krita
      gimp
      aseprite
      freecad
      wacomtablet


      # Tools
      pavucontrol
      lxappearance
      burpsuite

      # Communication
      discord
      skypeforlinux

      # Files & Notes
      gnome.nautilus
      xfce.thunar
      xfce.mousepad
      obsidian
      rnote
  
      # Dev
      rustup
      python3
      gcc
      glib
      jetbrains-toolbox
      cmake
      gtk3
      vscode

      # Games
      lunar-client
      steam
    
      # Misc
      libsForQt5.qt5.qtgraphicaleffects

  ];

    fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      nerdfonts
      proggyfonts
    ];
    };

}

