{ lib, pkgs, ... }:

with builtins;

{
  imports = [
    ./autorandr.nix

    ../../../../home-manager/profiles/common.nix
    ../../../../home-manager/profiles/development.nix
    ../../../../home-manager/profiles/graphical.nix

    ../../../../home-manager/profiles/wm/i3.nix

    ../../../../home-manager/profiles/appearance/high-contrast.nix
    ../../../../home-manager/profiles/keybindings/emacs.nix

    ../../../../home-manager/profiles/programs/vscode.nix
  ] ++ lib.optional (pathExists ./private) ./private;

  # Custom module config:
  custom = {
    defaultBrowser = {
      enable = true;
      package = pkgs.qutebrowser;
    };

    emacsConfig = {
      enable = true;
      defaultEmailApplication = true;
      defaultPdfApplication = true;
    };
  };
}