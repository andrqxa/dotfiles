cd ~/.vim_go

echo 'set runtimepath+=~/.vim_go

source ~/.vim_go/vimrcs/basic.vim
source ~/.vim_go/vimrcs/filetypes.vim
source ~/.vim_go/vimrcs/plugins_config.vim
source ~/.vim_go/vimrcs/extended.vim

try
source ~/.vim_go/my_configs.vim
catch
endtry' > ~/.vimrc

echo '
[Desktop Entry]
Version=1.0
Type=Application
Name=VimGo
Comment=
Exec=gvim -u ~/.vimrc.go
Icon=/home/andrejjj/.vim_go/icons/go-mascot-yellow.png
Path=
Terminal=false
StartupNotify=false' > ~/Desktop/VimGo.desktop


echo "Installed the Go Vim configuration successfully! Enjoy :-)"
