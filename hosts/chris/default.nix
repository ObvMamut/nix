{ inputs, config, pkgs, ... }:

{
	imports =
	[ 
		<nixos-hardware/dell/xps/15-9520/nvidia>     
		./modules/hardware/hardware-configuration.nix
		./modules/packages.nix
		./modules/hardware/xserver.nix
		./modules/hardware/sound.nix
		./modules/hardware/nvidia.nix
		./modules/hardware/bluetooth.nix
		./modules/services/power.nix
		./modules/locale.nix
		./modules/configuration/thunar.nix
		./modules/configuration/steam.nix
		./modules/users/mamut.nix
		inputs.home-manager.nixosModules.home-manager
	];

	home-manager = {
		extraSpecialArgs = { inherit inputs; };
		users = {
			mamut = import ./modules/users/home.nix;
		};
	};

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "CHRIS"; 
	networking.networkmanager.enable = true;

	services.flatpak.enable = true;
	xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
	xdg.portal.config.common.default = "gtk";
	xdg.portal.enable = true;

	services.printing.enable = true;

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	nixpkgs.config.permittedInsecurePackages = [
		"electron-25.9.0"
	];

	programs.zsh.enable = true;
	users.defaultUserShell = pkgs.zsh;

	system.stateVersion = "24.05";

}
