{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ########################## Development ##########################
    android-tools
    android-studio
    cmake
    cairo.dev
    dbus.dev
    flutter
    go
    gcc
    gdb
    gtk3.dev
    gtk4.dev
    gnumake
    glib.dev
    gst_all_1.gstreamer.dev
    gst_all_1.gst-plugins-base.dev
    gst_all_1.gst-plugins-good.dev
    gst_all_1.gst-plugins-bad.dev
    gst_all_1.gst-plugins-ugly.dev
    gst_all_1.gst-libav.dev
    gst_all_1.gst-vaapi.dev
    gdk-pixbuf.dev
    graphene.dev
    harfbuzz.dev
    lua
    llvm
    libGL.dev
    libadwaita.dev
    libunwind.dev
    jdk17
    mesa
    ninja
    nodejs
    orc.dev
    openssl
    openssl.dev
    pkg-config
    pango.dev
    qt5.full
    # qt6.full
    qtcreator
    rustup
    sqlite
    sqlite.dev
    typescript
    vscode
    xdotool
    virtualenv
    vulkan-tools
    vulkan-loader.dev
    vulkan-validation-layers
    xorg.libXft.dev
    xorg.libXmu.dev
    xorg.libxcb.dev
    xorg.libX11.dev
    xorg.libXinerama
    xorg.xprop
    xorg.xcbproto

    ######## python3 ########
    (python3.withPackages
      (ps: with ps; [ ipython pandas requests pyquery pyyaml ]))

    ######## neovim ########
    ccls
    neovim
    nixd
    nixfmt-classic
    nodePackages.prettier

    ########################## Tools ##########################
    acpi
    alsa-utils
    autojump
    appimage-run
    audacity # sound editor
    blender # 3D editor
    brave
    brightnessctl
    calibre
    evince
    feh
    file
    freetype
    firefox
    flameshot
    fontconfig
    findutils
    gimp # picture editor
    gthumb
    gnome.zenity
    htop
    httpie
    inkscape # vector editor
    jq
    just
    killall
    imagemagick
    nvtopPackages.intel
    obs-studio
    openshot-qt
    proxychains
    pciutils
    rsync
    redshift
    screenkey
    sof-firmware
    tree
    unzip
    unrar-wrapper
    vlc
    zoxide
    patchelf
    wpa_supplicant_gui
  ];
}
