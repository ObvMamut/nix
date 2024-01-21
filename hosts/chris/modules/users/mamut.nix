{ pkgs, ... }:
{
    users.users.mamut = {
        isNormalUser = true;
        description = "mamut";
        extraGroups = [ "networkmanager" "wheel" ];
        shell = pkgs.zsh;
    };

}