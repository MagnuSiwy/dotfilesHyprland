swayidle -w timeout 570 'swaylock --screenshots --clock \
			--indicator --indicator-radius 100 \
			--effect-blur 7x5 --ring-color bb00cc \
			--fade-in 0.2 --grace 10' \
            timeout 600 'hyprctl dispatch dpms off' \
            resume 'hyprctl dispatch dpms on' \
            timeout 900 'systemctl suspend' \
            before-sleep 'swaylock --screenshots --clock \
			--indicator --indicator-radius 100 \
			--effect-blur 7x5 --ring-color bb00cc \
			--fade-in 0.2 --grace 10' &
