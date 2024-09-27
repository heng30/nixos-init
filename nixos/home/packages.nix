{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ########################## Development ##########################
    android-tools
    android-studio
    cmake
    cairo
    cairo.dev
    dbus
    flutter
    fontconfig
    go
    gcc
    gdb
    gtk3
    gtk4
    gtk3.dev
    gtk4.dev
    gnumake
    glib
    glib.dev
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
    gst_all_1.gst-vaapi
    gdk-pixbuf
    gdk-pixbuf.dev
    graphene
    graphene.dev
    harfbuzz
    harfbuzz.dev
    lua
    llvm
    libGL
    libadwaita
    libclang
    libunwind
    jdk17
    mesa
    ninja
    nodejs
    orc
    openssl
    openssl.dev
    pango
    pango.dev
    protobuf
    pkg-config
    qt5.full
    qtcreator
    rocksdb
    rustup
    sqlite
    typescript
    upx
    vscode
    virtualenv
    vulkan-tools
    vulkan-loader
    vulkan-loader.dev
    vulkan-validation-layers
    webkitgtk
    xdotool
    xorg.libXft
    xorg.libXmu
    xorg.libxcb
    xorg.libX11
    xorg.libX11.dev
    xorg.libXext
    xorg.libXinerama
    xorg.libXcursor
    xorg.libXfixes
    xorg.libXrender
    xorg.libXi
    xorg.libXtst
    xorg.xprop
    xorg.xcbproto

    ######## python3 ########
    (python3.withPackages
      (ps: with ps; [ pip ipython pandas requests pyquery pyyaml black ]))

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
    fastfetch
    feh
    file
    freetype
    firefox
    flameshot
    fontconfig
    fontconfig.dev
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
    tldr
    tree
    unzip
    unrar-wrapper
    vlc
    zip
    zoxide
    patchelf
    wpa_supplicant_gui
  ];
}
