{ pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        git
        home-manager
        pamixer
        acpilight
        playerctl
        wirelesstools
        rofi
        polybar
        nitrogen
        picom-jonaburg
    ];

}