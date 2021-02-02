{ ... }:

{
  services.sxhkd = {
    enable = true;
    keybindings = {
      "super + r" = "pkill -USR1 -x sxhkd";
      "super + Escape" = "slock";
      "super + ctrl + {q,r}" = "bspc {quit, wm -r}";
      "super + {_,shift + }q" = "bspc node -{c,k}";

      # focusing

      # tiled/monocle
      "super + m" = "bspc desktop -l next";

      # window state
      "super + ctrl + {t,shift + t,s,f}" = "bspc node -t {tiled,pseudo_tiled,floating,fullscreen}";

      # node flags
      "super + ctrl + {m,x,y,z}" = "bspc node -g {marked,locked,sticky,private}";

      #focus node in dir
      "super + {_,shift + }{h,j,k,l}" = "bspc node -{f,s} {west,south,north,east}";

      #focus next/prev window in desktop
      "super + {_,shift + }Tab" = "bspc node -f {next,prev}.local.!hidden.window";

      #focus next prev desktop
      "super + bracket{left,right}" = "bspc desktop -f {prev,next}.local";

      #focus last node/desektop
      "super + {_,shift + }grave" = "bspc {node,desktop} -f last";

      #focus/send to desktop
      "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}'";

      # move/resize
      # e x p a n d window
      "super + alt + {h,j,k,l}" = "bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}";

      #move floating
      "super + {Left,Down,Up,Right}" = "bspc node -v {-20 0,0 20,0 -20,20 0}";

      # g a p s
      "super + {_,shift + }minus" = "bspc config -d focused window_gap $((`bspc config -d focused window_gap` {-,+} 5 ))";

      # launch apes
      "super + Return" = "alacritty";
      
      # prog launcher
      "super + @space" = "rofi -config ~/.config/rofi/nord.rasi -show drun";

      # audio
      "super + F1" = "pactl set-sink-mute 0 toggle";

      #adjust volume
      "super + {F2,F3}" = "{sh -c 'pactl set-sink-mute 0 false ; pactl set-sink-volume 0 -5%',sh -c 'pactl set-sink-mute 0 false ; pactl set-sink-volume 0 +5%'}";

      "super + F4" = "pactl set-source-mute 1 toggle";

      "super + {F5,F6,F7}" = "mpc -q {prev,toggle,next}";

      "super + {F11,F12}" = "brightnessctl s {5%-,+5%}";

      "super + shift + c" = "maim -s | xclip -selection clipboard -t image/png";

      "super + c" = "maim ~/pic/scr/$(date +%Y%m%d-%H%M.%S.png)";
    };
  };
}
