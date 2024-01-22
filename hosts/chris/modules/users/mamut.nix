{ pkgs, ... }:
{
    users.users.mamut = {
        isNormalUser = true;
        description = "mamut";
        extraGroups = [ "networkmanager" "wheel" "video" ];
        shell = pkgs.zsh;
    };

}