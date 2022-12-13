{ config, pkgs, inputs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # use the Xanmod kernel
  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
  # use kernal packages
  boot.extraModulePackages = with config.boot.kernelPackages;
    [ v4l2loopback.out ];
  boot.kernelModules = [
    # Virtual Camera
    "v4l2loopback"
    # Virtual Microphone, built-in
    "snd-aloop"
  ];

  boot.extraModprobeConfig = ''
    # exclusive_caps: Skype, Zoom, Teams etc. will only show device when actually streaming
    # card_label: Name of virtual camera, how it'll show up in Skype, Zoom, Teams
    # https://github.com/umlaeute/v4l2loopback
    options v4l2loopback exclusive_caps=1 card_label="Virtual Camera"
  '';
  # Enable ledger support
  hardware.ledger.enable = true;


  nixpkgs.config = {
    # Allow proprietary packages
    allowUnfree = true;
  };

  # Set your time zone.
  time.timeZone = "Brazil/East";

  # Select internationalisation properties.
  i18n.defaultLocale = "pt_BR.UTF-8";
  services.gnome3.gnome-keyring.enable = true;
  security.pam.services.sddm.enableGnomeKeyring = true;
  # Enable the X11 windowing system.
  # Enable the Plasma 5 Desktop Environment.
  services = {
    xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];
      desktopManager.plasma5.enable = false;
      displayManager = {
        sddm.enable = true;
      };
    };
  };
  hardware.opengl.driSupport = true;
  # For 32 bit applications
  hardware.opengl.driSupport32Bit = true;

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = {
  #   "eurosign:e";
  #   "caps:escape" # map caps to escape.
  # };

  # Enable CUPS to print documents.
  # services.printing.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };
  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enmable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
    packages = with pkgs; [
    ];
  };
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    git
    cmake
    wget
    curl
    wayland
    grim
    wl-clipboard
    slurp
  ];
  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  # List services that you want to enable:
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";
  };
  services.flatpak.enable = true;
  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).

}

