{ config, lib, pkgs, ...}: with lib;
{
	services.xserver = {
		enable = true;
		layout = "us";
	    desktopManager.xfce = {
			enable = true;
			enableXfwm = false;
		};

	    windowManager.bspwm.enable = true;
        windowManager.bspwm.configFile = "/home/manas/.config/bspwm/bspwmrc";
        windowManager.bspwm.sxhkd.configFile = "/home/manas/.config/sxhkd/sxhkdrc";
        desktopManager.xterm.enable = false;

        displayManager = {
            defaultSession = "none+bspwm";
            lightdm.enable = true;
        };
    };

    services.xrdp.defaultWindowManager = "bspwm";
}