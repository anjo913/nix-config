{ ... }:

{
  xsession.windowManager.bspwm = {
    enable = true;
    settings = {
      "border_width" = 10;
      "focused_border_color" = "#2e3440";
      "active_border_color" = "#2e3440";
      "normal_border_color" = "#2e3440"; 
      "window_gap" = 12;
      "split_ratio" = 0.52;
      "borderless_monocle" = true;
      "gapless_monocle" = true;
    };
    monitors = { "eDP-1" = [ "1" "2" "3" "4" "5" "6" ]; };
    extraConfig = ''
      pkill picom
      pkill polybar
      pgrep -x sxhkd > /dev/null || sxhkd &
      polybar minimal &
      picom &
    '';

    rules = {
      "Firefox" = {
        desktop = "^1";
      };
      "discord" = {
        desktop = "^4";
      };
      "Gimp" = {
        desktop = "^5";
	      follow = true;
      	state = "floating";
      };
      "pavucontrol" = {
        desktop = "^6";
        state = "floating";
      };
      "Screenkey" = {
        manage = false;
      };
    };
  };
}
