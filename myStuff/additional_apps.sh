apps="v4l2loopback-dkms discord telegram-desktop spotify-launcher steam lutris wine-staging"

sudo pacman -S --needed $apps

echo "Install lutris dependencies"
sudo pacman -S --needed --asdeps giflib lib32-giflib gnutls lib32-gnutls v4l-utils lib32-v4l-utils libpulse lib32-libpulse alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib sqlite lib32-sqlite libxcomposite lib32-libxcomposite ocl-icd lib32-ocl-icd libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader sdl2 lib32-sdl2

# yay -S visual-studio-code-bin pam-fprint-grosshack fprint
