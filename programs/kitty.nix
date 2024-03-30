{ config, lib, ... }:

{
	programs.kitty = {
		enable = true;
		theme = "N0tch2k";
        font.name = "JetBrains Mono Nerd Font";

		# https://sw.kovidgoyal.net/kitty/conf/
		extraConfig = ''
			window_margin_width 9
			background_opacity 0.78
			# foreground #baafa9
			background #010100
		'';
	};
}
