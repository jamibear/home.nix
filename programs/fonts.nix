{ config, pkgs, ... }:

{
	fonts.fontconfig = {
        enable = true;
    };


	home.packages = [
        pkgs.google-fonts
		(pkgs.nerdfonts.override {
			fonts = [
				"FiraCode" 
				"DroidSansMono"
				"JetBrainsMono"
			];
		})
        pkgs.tt2020
	];
}
