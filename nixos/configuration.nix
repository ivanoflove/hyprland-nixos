# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nvidiaoffload.nix
      ./fonts.nix
      ./fcitx.nix
      ./desktop.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/efi"; 
  boot.loader.systemd-boot.configurationLimit = 10;
  
  # gpu set
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.blacklistedKernelModules = [ "nouveau" ];
  boot.supportedFilesystems = [ "ntfs" ];
  
  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true; 
  
  # Easiest to use and most distros use this by default.
  services.blueman.enable = true;
  services.gnome.gnome-keyring.enable = true;
  hardware = {
  #    pulseaudio.enable = true;
    bluetooth.enable = true;
  };

  # proxy
  programs.clash-verge = {
    enable = true;
    autoStart = true;
    tunMode = true;
  };
  
  services.v2raya.enable = true;
  services.supergfxd.enable = false;
  services = {
    asusd = {
      enable = true;
      enableUserService = true;
    };
  };
  
  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.power-profiles-daemon.enable = true;


  
  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

 
  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  
  # add /.local to $PATH
  environment.variables={
    NIXOS_OZONE_WL = "1";
    PATH = [
      "\${HOME}/.local/bin"
      "\${HOME}/.config/rofi/scripts"
    ];
    NIXPKGS_ALLOW_UNFREE = "1";
  };

  
  
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # nixpkgs.config.cudaSupport = true;
  security.sudo.wheelNeedsPassword = false;
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # programs.zsh.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ivan = {
    isNormalUser = true;
    description = "ivan";
    extraGroups = [ "wheel" "networkmanager" "video" "kvm" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [];
    # shell = pkgs.zsh;
  };

  # environment.shells = with pkgs; [ zsh ];
  
  environment.systemPackages = with pkgs;[
    power-profiles-daemon
    blueman
    gnome.gnome-keyring
    git
    
    # python
    # (python311.withPackages(ps: with ps; [ pandas numpy ]))
    # gcc
  ];

 
  # do garbage collection weekly to keep disk usage low
  system.stateVersion = "23.05"; # Did you read the comment?
  
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

 
  # Optimise storage
  nix.settings.auto-optimise-store = true;
  
}

