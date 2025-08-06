# 我的neovim配置

使用了lazy.nvim作为包管理器,自己写的小插件去运行代码
F5运行,F9拓展运行(其实就是同一个文件类型两种执行命令)
目前支持的语言:
- python
- c/c++
- java
- js/ts
- html
- css(包含tailwindcss)
- vue
- go
- C#
- lua
- rust(目前有问题)
对于docker file,markdown也有插件支持

## 配置目前依赖:
- git
- npm (windows安装nodejs)
- pip (来源于python,windows安装python)
- gcc (windows上面最好也安装mingw)
- 你要运行的代码对应的环境

### 目前lazygit需要手动安装,来确保此配置能更加完美的运行

```
# windows11
winget install lazygit

# arch
sudo pacman -S lazygit

# Ubuntu
sudo apt install lazygit

```
