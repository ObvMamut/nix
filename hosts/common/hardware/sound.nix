{ ... }:

{

  # sound.enable = true;
  # hardware.pulseaudio.enable = false;
  # hardware.pulseaudio.extraConfig = "load-module module-combine-sink";
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

}
