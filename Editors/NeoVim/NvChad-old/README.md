Step of installation

0) mkdir -p ~/.local/share/nvim/nvchad/base46 (or %USER_HOME%\AppData\Local\nvim-data/nvchad/base46/)
1) touch defaults   
2) git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
3) go install golang.org/x/tools/gopls@latest
4) nvim
5) :MasonInstallAll
6) :qa!
7) go install github.com/incu6us/goimports-reviser/v3@latest
8) go install mvdan.cc/gofumpt@latest
9) go install github.com/segmentio/golines@latest
10) go install github.com/go-delve/delve/cmd/dlv@latest
11) :TSInstall go [Optional]

