{ config, lib, pkgs, ... }:



{
  imports = [ 
    ./hyprland-environment.nix
  ];

  home.packages = with pkgs; [ 
    waybar
    swww
  ];
  
  #test later systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = { 
    enable = true; 
    systemdIntegration = true; 
    enableNvidiaPatches = true; 
    extraConfig = builtins.readFile ./config.nix;
  };

  home.file.".config/hypr/colors".source = ./colors.nix;
}
