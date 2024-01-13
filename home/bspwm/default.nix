{ config, lib, pkgs, ...}: with lib;
{

    imports = [
        ./foot.nix
    ];

	services.xserver = {
		enable = true;
		layout = "us";
		xkbOptions = "eurosign:e";
	    desktopManager.xfce = {
			enable = true;
			enableXfwm = false;
		};

	    windowManager.bspwm.enable = true;
        windowManager.default = "bspwm";
        windowManager.bspwm.configFile = "/home/manas/dotfiles/bspwmrc";
        windowManager.bspwm.sxhkd.configFile= "/home/manas/dotfiles/sxhkdrc";
        desktopManager.xterm.enable = false;

        displayManager.lightdm = {
            enable = true;
            autoLogin.enable = true;
            autoLogin.user = "manas";
        };
    };

    services.xrdp.defaultWindowManager = "bspwm";
}