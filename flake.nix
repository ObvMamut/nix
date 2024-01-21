{
	description = "NixOS Configuration";

  	inputs = {
    	nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    	home-manager = {
      		url = "github:nix-community/home-manager";
      		inputs.nixpkgs.follows = "nixpkgs";
    	};
    
    	nix-colors.url = "github:misterio77/nix-colors";
     
    	plasma-manager = {
      		url = "github:pjones/plasma-manager";
      		inputs.nixpkgs.follows = "nixpkgs";
     		  inputs.home-manager.follows = "home-manager";
    	};
  	};

  	outputs = { self, nixpkgs, home-manager, plasma-manager, ... }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      # Supported systems for your flake packages, shell, etc.
      systems = [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      # This is a function that generates an attribute by calling a function you pass to it, with each system as an argument
      forEachSystem = f: lib.genAttrs systems (system: f pkgsFor.${system});
      pkgsFor = lib.genAttrs systems (system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        });
    in {
      inherit lib;
      
      nixosConfigurations = {
        # Main desktop
        chris = lib.nixosSystem {
          modules = [ ./hosts/chris/default.nix ];
          specialArgs = { inherit inputs outputs; };
        };
        
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      homeConfigurations = {
        # Desktops
        "mamut@chris" = lib.homeManagerConfiguration {
          modules = [ ./hosts/chris/modules/home.nix ];
          pkgs = pkgsFor.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
        };
       
      };
    };
}
