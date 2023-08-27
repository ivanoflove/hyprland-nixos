{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./hyprland-environment.nix
  ];

  home.packages = with pkgs; [ 
    waybar
    swww
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    enableNvidiaPatches = true;
  };

  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;

  

  home.file.".config/hypr/colors".source = ./colors

}
