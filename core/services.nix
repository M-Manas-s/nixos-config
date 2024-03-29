{ lib, pkgs, ... }:
{
    # List services that you want to enable:
    services = {

        dbus.enable = true;
        tumbler.enable = true; # Thumbnail support for images
        xserver = {
            enable = true;
            libinput = {
                enable = true;
            };
            desktopManager = {
                xterm.enable = false;
            };
            wacom.enable = true;
            layout = "us";
            videoDrivers = ["nvidia"];
            displayManager = {
                defaultSession = "hyprland";
                lightdm.enable = false;
                sddm = {
                    enable = true;
                    wayland.enable = true;
                    theme = "tokyo-night";
                };
            };
        };

        redshift.enable = true;

        gnome.gnome-keyring.enable = true;

        gvfs = {
            enable = true;
            package = lib.mkForce pkgs.gnome3.gvfs;
        };

        pipewire = {
            enable = true;
            alsa.enable = true;
            audio.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
        };

        udev.packages = with pkgs; [
          via
        ];

        smartd = {
            enable = true;
            autodetect = true;
        };
    };

    location = {
        provider = "geoclue2";
    };

    xdg.portal = {
        enable = true;
        wlr.enable = true;
        extraPortals = with pkgs; [
            xdg-desktop-portal-gtk
        ];
    };

    # security.pam.services.swaylock = { #Swaylock fix for wrong password
    #     text = ''
    #         auth include login
    #         '';
    # };

    security.pam.services.swaylock = {};

    services.openssh.enable = true;
}

