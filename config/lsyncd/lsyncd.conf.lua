# 全局配置的参数应该很清楚，不需要解释了
settings {
    logfile    = "/tmp/lsyncd.log",
    statusFile = "/tmp/lsyncd.status",
    statusInterval = 3,
    insist = true
}


sync {
    default.rsyncssh,
    source = "/home/pittcat/Projects/gitlab/lab-project",                  --源目录
    delete = false,                          --保持完全同步
    host = "kingerzee@172.16.22.60",
    targetdir = "/home/kingerzee/pittcat/lab-project",               --目标目录
    exclude = {"data/*"},
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


sync {
    default.rsyncssh,
    source = "/home/pittcat/Projects/UbuntuDev/",                  --源目录
    delete = false,                          --保持完全同步
    host = "pittcat@192.168.28.155",
    targetdir = "/home/pittcat/Dev/",               --目标目录
    exclude = {"data/*"},
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

