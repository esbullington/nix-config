{ pkgs }:

with pkgs;

let
  aspellEnv = aspellWithDicts(ps: [ ps.en ps.sv ]);
  sysconfig = (import <nixpkgs/nixos> {}).config;
in ([
  nixStable
  nix-prefetch-scripts
  home-manager
  coreutils
  dnsutils
  moreutils
  fish
  openssh

  # git tools
  git-lfs
  gitAndTools.ghq
  gitAndTools.git-crypt
  gitAndTools.git-imerge
  gitAndTools.gitFull
  gitAndTools.hub
  gitAndTools.tig

  # system tools
  aspellEnv
  curl
  direnv
  fd
  file
  fzy
  gnumake
  gnupg
  htop
  most
  p7zip
  pinentry
  pwgen
  ripgrep
  tldr
  tree
  units
  unrar
  unzip
  wget
  xsv
  zip

  # dev tools
  bat
  editorconfig-core-c
  httpie
  jq
  cabal2nix
  stack2nix
] ++ lib.optionals stdenv.isLinux [
  # dev tools
  docker
  docker_compose
  sysdig

  # media tools
  playerctl
  surfraw
  youtube-dl

  # security tools
  lastpass-cli
  pass
] ++ lib.optionals sysconfig.services.xserver.enable [
  scripts.lock
  scripts.logout
  scripts.window_tiler

  feh
  firefox
  imagemagick
  kitty
  krita
  maim
  mpv
  qutebrowser
  rofi
  slack
  slop
  spotify
  xautolock
  xclip
  xorg.xhost
  xsel
  xss-lock

  cifs-utils
  nfs-utils

  blueman
  gnome3.gcr
  gnome3.gnome-keyring
  gnome3.seahorse
  libnotify
  networkmanagerapplet
  pavucontrol
  xfce.xfce4-notifyd

  gnome2.gtk
  gnome3.gtk
  paper-gtk-theme
  paper-icon-theme
] ++ lib.optionals stdenv.isDarwin [
  skhd

  # Applications
  docker
])
