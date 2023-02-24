session=${1:-xfce}

export GLFW_IM_MODULE=ibus
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US

case $session in
    i3|i3wm           ) exec i3;;
    kde               ) exec startplasma-x11;;
    xfce|xfce4        ) exec startxfce4;;
    # No known session, try to run it as command
    *                 ) exec $1;;
esac
