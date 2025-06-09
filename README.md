# 我的neovim配置

使用了lazy.nvim作为包管理器,自己写的小插件去运行代码

## 配置目前依赖:
- git
- npm (windows安装nodejs)
- pip (来源于python,windows安装python)
- gcc (windows上面最好也安装mingw)
- 你要运行的代码对应的环境

### 目前仍然有部分命令需要第一次手动执行,来确保此配置能更加完美的运行

```
# windows11
winget install lazygit
npm install -g astyle volar

# arch
sudo pacman -S lazygit
sudo npm install -g astyle volar

# Ubuntu
sudo apt install lazygit
sudo npm install -g astyle volar

```
### 第一次进入neovim之后,使用空格+ms去mason安装以下包(格式化程序):
- stylua
- prettier
- black
- fixjson
- rustfmt
- xmlformat
- gofumpt
