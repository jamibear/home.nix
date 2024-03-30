{
  description = "Home Manager configuration of minx";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags.url = "github:Aylur/ags";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprlock.url = "github:hyprwm/hyprlock";
    nvim.url = "github:juweeism/neovim.nix";
  };

  outputs = { nixpkgs, home-manager, hyprlock, nvim, ... }@inputs:
    let
      username = "minx";
      system = "x86_64-linux";
      pkgs = import nixpkgs { 
        system = "x86_64-linux"; 
	config = { 
	  allowUnfree = true;
	  permittedInsecurePackages = [
	    "electron-25.9.0"
    	  ];
	};
      };
    in {
      
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs username system; };
	    modules = [ ./nixos/configuration.nix ];
      };

      homeConfigurations."${username}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

    	extraSpecialArgs = { inherit inputs; };

        modules = [ 
	    ./home.nix 
	    hyprlock.homeManagerModules.default
	];
      };
    };
}
