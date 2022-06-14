# 全局配置的参数应该很清楚，不需要解释了
settings {
    logfile    = "/tmp/lsyncd.log",
    statusFile = "/tmp/lsyncd.status",
    insist = true,
    inotifyMode = "CloseWrite",
    statusInterval = 5
}




-- 将本地开发配置同步到ubuntu server 单向

sync {
    default.rsyncssh,
    source = "/home/pittcat/.space-vim/",                  --源目录
    delete = false,                          --保持完全同步
    host = "pittcat@192.168.28.155",
    targetdir = "/home/pittcat/.space-vim/",               --目标目录
    exclude = {".git/"},
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
    source = "/home/pittcat/.ndap_debugger",                  --源目录
    delete = false,                          --保持完全同步
    host = "pittcat@192.168.28.155",
    targetdir = "/home/pittcat/.ndap_debugger",               --目标目录
    exclude = {".git/"},
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



-- cuda server 单向

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


-- ubuntu server 单向同步

sync {
    default.rsyncssh,
    source = "/home/pittcat/Projects/lsyncd-exclude",                  --源目录
    delete = true,                          --保持完全同步
    host = "pittcat@192.168.28.155",
    targetdir = "/home/pittcat/Dev/lsyncd-exclude",               --目标目录
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



--  ubuntu server 双向同步文件夹
--
-- ignore directory

sync {
    default.rsyncssh,
    source = "/home/pittcat/Projects/gitlab/lab-project",                  --源目录
    excludeFrom="/home/pittcat/Projects/lsyncd-exclude/pyignore",
    delete = true,                          --保持完全同步
    host = "pittcat@192.168.28.155",
    targetdir = "/home/pittcat/Dev/gitlab/lab-project",               --目标目录
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
    source = "/home/pittcat/Projects/gitlab/Algorithm_Practice",                  --源目录
    delete = true,                          --保持完全同步
    excludeFrom="/home/pittcat/Projects/lsyncd-exclude/pyignore",
    host = "pittcat@192.168.28.155",
    targetdir = "/home/pittcat/Dev/gitlab/Algorithm_Practice",               --目标目录
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
