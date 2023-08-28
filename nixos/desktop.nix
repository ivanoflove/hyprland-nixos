{ config, lib, pkgs, ... }:
{
 
  programs.regreet.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        user = "ivan";
        command = "$SHELL -l";
      };
     };
   };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
    ];
  };
  # 
  # services = {
    # gvfs.enable = true; # Mount, trash, and other functionalities
    # tumbler.enable = true; # Thumbnail support for images
    # xserver = {
     # 
# 
      # desktopManager = {
        # xterm.enable = false;
      # };
# 
      # displayManager = {
        # # defaultSession = "hyprland";
        # lightdm.enable = false;
        # gdm = {
          # enable = true;
          # wayland = true;
        # };
      # };
    # };
  # };
  


  programs = {
      bash = {
        interactiveShellInit = ''
          if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
             WLR_NO_HARDWARE_CURSORS=1 Hyprland #prevents cursor disappear when using Nvidia drivers
          fi
        '';
      };
    };

  # programs.dconf.enable = true;


}
