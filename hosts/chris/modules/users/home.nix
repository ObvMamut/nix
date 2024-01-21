{ inputs, config, pkgs, ... }:

{

  imports = [
    inputs.nix-colors.homeManagerModules.default
   # ./modules/configuration/alacritty.nix
   # ./modules/configuration/rofi.nix
  ];
  
  home.username = "mamut";
  home.homeDirectory = "/home/mamut";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  colorScheme = inputs.nix-colors.colorSchemes.mountain;  

  

  home.packages = [
  
  ];


  home.file = {
 
  };

  home.sessionVariables = {
    
  };

 
  programs.home-manager.enable = true;

  programs.zsh = {
      enable = true;
      shellAliases = {
          update-nix = "sudo nixos-rebuild switch --impure --upgrade-all --flake ~/nix/#chris";
          avg = "/home/mamut/0x00/0x02/pronote/.venv/bin/python /home/mamut/0x00/0x02/pronote/main.py";
      };

      oh-my-zsh = {
        enable = true;
      };
  };

  programs.starship = {
    enable = true;
  };
  
}

