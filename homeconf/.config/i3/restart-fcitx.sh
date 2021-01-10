#! /usr/bin/env bash

kill `ps -A | grep fcitx5 | awk '{print $1}'` && fcitx5&
