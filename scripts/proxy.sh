#!/bin/sh

LOC=$(readlink -f "$0")
DIR=$(dirname "$LOC")

config_dir=/run/systemd/system/nix-daemon.service.d
config_path=$config_dir/override.conf

function enable() {
    mkdir -p $config_dir
    cat > "$config_path" <<EOF
[Service]
Environment="https_proxy=socks5://localhost:1084"'
EOF

    systemctl daemon-reload
    systemctl restart nix-daemon
}

function disable() {
    rm -f $config_path
    systemctl daemon-reload
    systemctl restart nix-daemon
}

if [ $1 = "enable" ]; then
    enable
elif [ $1 = "disable" ]; then
    disable
fi

