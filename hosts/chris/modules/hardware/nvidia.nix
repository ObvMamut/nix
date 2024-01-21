{ ... }:

{
  hardware = {

    opengl.driSupport32Bit = true;

    nvidia.prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    };

  };    
}
