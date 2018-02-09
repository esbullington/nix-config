{ config, pkgs, ... }:

{
  imports = [
    ./theme.nix
    ./xserver.nix
  ];

  services.xserver = {
    windowManager = {
      i3 = {
        enable = true;
        package = pkgs.i3-gaps;
      };
      default = "i3";
    };
    desktopManager = {
      xterm.enable = false;
    };
  };
  
  environment.systemPackages = with pkgs; [
    i3lock-color
    rofi
    kitty
  ];
}
