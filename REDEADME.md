## 安装步骤

### 安装常用的软件包

1. sudo pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort pkglist))
2. yay -S --needed $(comm -12 <(pacman -Slq | sort) <(sort aurlist))
3. 初始化 vim zsh tmux i3wm 等等
   bash setup.sh
   stow homeconf tmux zsh

4. 初始化一些语言的包

需要初始化的 lang:

```
cfamily
bash
rust
python
web
```

### 实体机需要删除的软件包

xf86-input-vmmouse
xf86-video-vmware

### 实体机需要多装的软件包

蓝牙:[Blueberry](https://wiki.archlinux.org/index.php/Bluetooth)

网络:[networkmanager](https://wiki.archlinux.org/index.php/NetworkManager#Installation)

### 输入法初始化

- 将 /config/rime-dict 的文件复制到~/.local/share/fcitx5/rime

## aurlist pkglist gen

pacman -Qqm > aurlist

pacman -Qqet > pkglist

### appimage flatpak snap web 如何使用
https://github.com/vinifmor/bauh
https://github.com/TheAssassin/AppImageLauncher


**Appimage**
```bash
AppImageLauncher app.AppImage(just for appimage) or bauh
```
快速启动：rofi -show drun

## 自动同步备份多个文件夹

lsyncd 使用场景：多个主机编辑文件，并且运行(比如有些项目需要到不同的主机上运行)，然后同步倒源主机，

- 可以避免多次 git 操作
- 降低本地开发机的资源消耗

```lua

全局配置的参数应该很清楚，不需要解释了
settings {
    logfile    = "/tmp/lsyncd.log",
    statusFile = "/tmp/lsyncd.status",
}

sync {
    default.rsyncssh,
    source = "/home/pittcat/Downloads/py-package",                  --源目录
    delete = true,                          --保持完全同步
    host = "kingerzee@172.16.22.60",
    targetdir = "/home/kingerzee/pittcat/py-package",               --目标目录
    rsync = {
        binary = "/usr/bin/rsync",          --使用rsync同步
        archive = true,                     --归档
        compress = true,                    --压缩
        owner = true,                       --属主
        perms = true,                       --权限
        links = true,                       --copy link
        whole_file = false,
        },
    ssh = {
        port = 22
        }
}

```
