{ ... }:
{
    programs.steam = {
     enable = true;
     remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote remotePlay    
     dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
}