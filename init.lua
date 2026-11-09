function reloadConfig(files)
  doReload = false
  for _,file in pairs(files) do
    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
  end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

hs.hotkey.bind({"ctrl", "cmd", "shift"}, "4", function()
    hs.task.new("/usr/sbin/screencapture", nil, {"-i", "-c"}):start()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
    hs.alert.show("Hello World!")
end)

hs.hotkey.bind({"cmd", "shift"}, "E", function()
    hs.application.open("org.gnu.Emacs")
end)

hs.hotkey.bind({"cmd", "shift"}, "W", function()
    hs.application.open("com.tencent.xinWeChat")
end)

hs.hotkey.bind({"cmd", "shift"}, "C", function()
    hs.application.open("com.google.Chrome")
end)

hs.hotkey.bind({"cmd", "shift"}, "M", function()
    hs.application.open("com.netease.163music")
end)

hs.hotkey.bind({"cmd", "shift"}, "F", function()
    hs.application.open("com.electron.lark")
end)

hs.hotkey.bind({"cmd", "shift"}, "T", function()
    hs.application.open("org.alacritty")
end)

hs.hotkey.bind({"cmd", "shift"}, "O", function()
    hs.application.open("md.obsidian")
end)

local dndTask
hs.hotkey.bind({"cmd", "shift"}, "D", function()
    if dndTask and dndTask:isRunning() then return end

    dndTask = hs.task.new("/usr/bin/shortcuts", function(exitCode, _, stderr)
        dndTask = nil
        if exitCode ~= 0 then
            hs.printf("切换勿扰模式失败：%s", stderr)
            hs.alert.show("切换勿扰模式失败，请检查快捷指令")
        end
    end, {"run", "Hammerspoon 切换勿扰模式"})

    if not dndTask:start() then
        dndTask = nil
        hs.alert.show("无法启动勿扰模式快捷指令")
    end
end)
