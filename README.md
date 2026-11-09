
## HammerSpoon official website

https://www.hammerspoon.org/

## 勿扰模式快捷键

`Command + Shift + D`：切换 macOS 勿扰模式。由 `init.lua` 绑定，
调用 macOS 快捷指令 `Hammerspoon 切换勿扰模式`，不模拟鼠标点击。
该指令仅包含“设置专注模式”操作，设为“切换勿扰模式”。

首次使用或换电脑时，双击导入仓库内的
[Hammerspoon 切换勿扰模式.shortcut](<shortcuts/Hammerspoon 切换勿扰模式.shortcut>)，
保留指令名称，然后重新加载 Hammerspoon 配置。本机已完成导入。

## Using this configuration

```shell
# https://github.com/Hammerspoon/hammerspoon/issues/579
defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/.hammerspoon/init.lua"

defaults write com.apple.HIToolbox AppleCapsLockSwitchesInputSource -bool true
# OR

mkdir -p ~/.hammerspoon

ln ~/.config/.hammerspoon/init.lua ~/.hammerspoon/init.lua
```
