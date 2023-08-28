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

  # home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
# 
  # # https://github.com/ryan4yin/wallpapers
  # home.file.".config/wallpapers".source = ./wallpapers;
 # 
  # home.file.".config/hypr/colors".source = ./colors;

  home.file = {
    "~/.config/hypr/hyprland.conf" = { source = ./hyprland.conf;};
    "~/.config/wallpapers" = { source = ./wallpapers;};
    "~/.config/hypr/colors" = { source = ./colors;};
  };
  

}
