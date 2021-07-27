# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/shoi.ito/google-cloud-sdk/path.fish.inc' ]; . '/Users/shoi.ito/google-cloud-sdk/path.fish.inc'; end

# lsの色を変えたいのに変わってくれない
# set -x LSCOLORS cxfxcxdxbxegedabagacad

alias python='python3'

alias cdUnityProject='cd /media/WindowsDisk/Users/uranu/UnityProject/'
alias cdptf='cd /media/WindowsDisk/Users/uranu/UnityProject/PlayTheFox20200223/playthefox'
alias cdWin='cd /media/WindowsDisk/Users/uranu'
alias cdFPXG='cd /media/GDrive/ToyamaLab/VRInterface/Assets/'

theme_gruvbox light

set PATH ~/go/bin $PATH

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# mono from homebrew
# set PATH /usr/local/Cellar/mono/6.12.0.122/bin $PATH
