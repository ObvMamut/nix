{ ... }:
{

    services.printing.enable = true;

    services.avahi.nssmdns4 = {
  		enable = true;
  		nssmdns = true;
  		openFirewall = true;
	};
}