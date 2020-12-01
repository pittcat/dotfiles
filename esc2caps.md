#### 1
yay -S interception-tools interception-caps2esc

#### 2
/etc/udevmon.yaml

- JOB: "intercept -g $DEVNODE | caps2esc | uinput -d $DEVNODE"
  DEVICE:
     EVENTS:
       EV_KEY: [KEY_CAPSLOCK, KEY_ESC]

#### 3
/etc/systemd/system/udevmon.service

[Unit]
Description=udevmon
Wants=systemd-udev-settle.service
After=systemd-udev-settle.service

[Service]
ExecStart=/usr/bin/nice -n -20 /usr/bin/udevmon -c /etc/udevmon.yaml

[Install]
WantedBy=multi-user.target

#### 4
sudo systemctl enable --now udevmon
