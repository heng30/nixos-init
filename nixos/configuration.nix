# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

let
  daily = builtins.toString ../routine/daily.sh;
  weekly = builtins.toString ../routine/weekly.sh;
in {
  imports = [ ./hardware-configuration.nix ];

  # boot.loader.systemd-boot.enable = true; # Use the systemd-boot EFI boot loader.
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
    };
  };

  system.activationScripts.script.text = ''
    mkdir -p /var/lib/AccountsService/{icons,users}
    cp ${config.users.users.blue.home}/init/images/avatar.png /var/lib/AccountsService/icons/blue
    echo -e "[User]\nIcon=/var/lib/AccountsService/icons/blue\n" > /var/lib/AccountsService/users/blue
  '';

  time.timeZone = "Asia/Shanghai";
  networking = {
    hostName = "nixos";
    networkmanager.enable = false;
    wireless = {
      enable = true;
      # extraConfig = "ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=wheel";
      # userControlled.enable = true; # reboot will lost the connection, even though I save the wireless configure
    };
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "127.0.0.1:1084";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  i18n = {
    # defaultLocale = "zh_CN.UTF-8";
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enabled = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-gtk
        fcitx5-chinese-addons
        fcitx5-nord
      ];
    };
  };

  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true; # use xkb.options in tty.
  };

  services = {
    openssh.enable = true;
    printing.enable = true; # Enable CUPS to print documents.
    libinput.enable = true; # Enable touchpad support
    displayManager.sddm = {
      enable = true;
      theme = "catppuccin-mocha";
      package = pkgs.kdePackages.sddm;
    };

    xserver = {
      enable = true;
      videoDrivers = [ "modesetting" ];
      # displayManager.gdm.enable = true;
      windowManager.dwm = {
        enable = true;
        package = pkgs.dwm.overrideAttrs { src = ../dwm-6.2; };
      };

      # Configure keymap in X11
      xkb = {
        layout = "us";
        # options = "eurosign:e,caps:escape";
      };
    };
    cron = {
      enable = true;
      systemCronJobs = [
        "0 23 * * * blue ${daily}" # daily
        "0 23 * * 0 blue ${weekly}" # weekly
      ];
    };
  };

  hardware = {
    opengl.enable = true;
    pulseaudio.enable = true;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.zsh;
    users.blue = {
      isNormalUser = true;
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
      home = "/home/blue";
      description = "Blue";
      shell = pkgs.zsh;

      packages = with pkgs; [
        xsel
        dmenu
        picom
        imwheel
        xorg.xrandr
        (st.overrideAttrs (oldAttrs: rec {
          configFile =
            writeText "config.def.h" (builtins.readFile ../st-config.h);
          postPatch = ''
            ${oldAttrs.postPatch}
             cp ${configFile} config.def.h'';
          patches = [
            ../st-patchs/st-w3m-0.8.3.diff
            ../st-patchs/st-font2-0.8.5.diff
            ../st-patchs/st-clipboard-0.8.3.diff
            ../st-patchs/st-scrollback-0.8.5.diff
            ../st-patchs/st-alpha-20220206-0.8.5.diff
            ../st-patchs/st-blinking_cursor-20230819-3a6d6d7.diff
            ../st-patchs/st-bold-is-not-bright-20190127-3be4cf1.diff
          ];
        }))
      ];
    };
  };

  nixpkgs.config.allowUnfree = true;
  # virtualisation.waydroid.enable = true; # android run environment

  environment.variables.EDITOR = "vim";
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    git-lfs

    (pkgs.catppuccin-sddm.override {
      flavor = "mocha";
      font = "Noto Sans";
      fontSize = "30";
      background = ../images/login.jpg;
      loginBackground = true;
    })

    # create a fhs environment by command `fhs`, so we can run non-nixos packages in nixos!
    (let base = pkgs.appimageTools.defaultFhsEnvArgs;
    in pkgs.buildFHSUserEnv (base // {
      name = "fhs";
      targetPkgs = pkgs:
        (
          # pkgs.buildFHSUserEnv 只提供一个最小的 FHS 环境，缺少很多常用软件所必须的基础包, 所以直接使用它很可能会报错
          # pkgs.appimageTools 提供了大多数程序常用的基础包，所以我们可以直接用它来补充
          (base.targetPkgs pkgs) ++ (with pkgs; [
            pkg-config
            ncurses
            clang
            cmake
            flutter
            jdk17
            gtk3
            gtk4
            gst_all_1.gstreamer
            gst_all_1.gst-plugins-base
            gst_all_1.gst-plugins-good
            gst_all_1.gst-plugins-bad
            gst_all_1.gst-plugins-ugly
            gst_all_1.gst-libav
            gst_all_1.gst-vaapi
          ]));
      profile = "export FHS=1";
      runScript = "zsh";
      extraOutputsToInstall = [ "dev" ];
    }))
  ];

  programs = {
    slock.enable = true;
    zsh.enable = true;
    bash.shellAliases = { os-switch = "sudo nixos-rebuild switch"; };

    # Some programs need SUID wrappers, can be configured further or are started in user sessions.
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        cairo
        fontconfig
        glib
        gst_all_1.gstreamer
        gst_all_1.gst-plugins-base
        gst_all_1.gst-plugins-good
        gst_all_1.gst-plugins-bad
        gst_all_1.gst-plugins-ugly
        gst_all_1.gst-libav
        gst_all_1.gst-vaapi
        gdk-pixbuf
        graphene
        harfbuzz
        libGL
        libadwaita
        libunwind
        openssl
        xdotool
        xorg.libXft
        xorg.libXmu
        xorg.libxcb
        xorg.libX11
        xorg.libXext
        xorg.libXinerama
        xorg.libXcursor
        xorg.libXfixes
        xorg.libXrender
        xorg.xprop
        xorg.xcbproto
      ];
    };
  };

  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      source-code-pro
      source-han-sans
      source-han-serif
      twemoji-color-font
      sarasa-gothic
      openmoji-color
      nerdfonts
    ];

    fontconfig = {
      defaultFonts = {
        emoji = [ "Twitter Color Emoji" "Noto Color Emoji" "OpenMoji Color" ];
        monospace =
          [ "Noto Sans Mono CJK SC" "Sarasa Mono SC" "DejaVu Sans Mono" ];
        sansSerif = [ "Noto Sans CJK SC" "Source Han Sans SC" "DejaVu Sans" ];
        serif = [ "Noto Serif CJK SC" "Source Han Serif SC" "DejaVu Serif" ];
      };
    };
  };

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
        # "https://mirror.sjtu.edu.cn/nix-channels/store"
        # "https://mirrors.ustc.edu.cn/nix-channels/store"
        "https://cache.nixos.org"
      ];
      allowed-users = [ "@wheel" ];
    };
  };

  system.stateVersion = "24.05";
}

