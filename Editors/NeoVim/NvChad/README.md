Step of installation
0) mkdir -p ~/.local/share/nvim/nvchad/base46
   touch defaults
1) git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
2) go install golang.org/x/tools/gopls@latest
3) nvim
4) :MasonInstallAll
5) :qa!
6) go install github.com/incu6us/goimports-reviser/v3@latest
7) go install mvdan.cc/gofumpt@latest
8) go install github.com/segmentio/golines@latest
9) go install github.com/go-delve/delve/cmd/dlv@latest

