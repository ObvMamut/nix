{ pkgs, ... }:

{

  services.xserver = {
      enable = true;
      autorun = true;
      layout = "us";
      xkbVariant = "";
      libinput.enable = true;
      dpi = 180;
      displayManager = {
        defaultSession = "none+bspwm";
        sddm.enable = true;
        sddm.theme = "where-is-my-sddm-theme";
      };
      windowManager.bspwm = {
          enable = true;
          configFile = "${../../../common/bspwm/bspwmrc}";
          sxhkd.configFile = "${../../../common/bspwm/sxhkdrc}";
        };
    }; 
    
  # GNOME

  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;
  
  environment.variables = {
    GDK_SCALE = "2";
    GDK_DPI_SCALE = "0.5";
    _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
  };


  programs.dconf.enable = true; 
  programs.light.enable = true;

}
