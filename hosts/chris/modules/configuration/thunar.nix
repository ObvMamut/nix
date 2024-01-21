{ pkgs, ... }:
{
    programs.thunar.plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
    ];

    programs.file-roller.enable = true;
    programs.thunar.enable = true;

    services = {
        gvfs.enable = true;
        tumbler.enable = true;
    };
}