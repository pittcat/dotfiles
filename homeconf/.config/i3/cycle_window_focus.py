#!/usr/bin/python

import argparse
import i3ipc


def _get_sibling_window(previous: bool = False) -> i3ipc.Con:
    increment = -1 if previous else 1
    current_container = i3.get_tree().find_focused()
    siblings = current_container.workspace().descendants()
    siblings_len = len(siblings)
    index = (siblings.index(current_container) + increment) % siblings_len
    container = siblings[index]
    while not container.window or container.parent.type == 'dockarea':
        index = (index + increment) % siblings_len
        container = siblings[index]
    return container


def get_previous_window() -> i3ipc.Con:
    return _get_sibling_window(True)


def get_next_window() -> i3ipc.Con:
    return _get_sibling_window()


parser = argparse.ArgumentParser()
parser.add_argument("-p", "--previous", help="Focus the previous window.", action="store_true")
args = parser.parse_args()

i3 = i3ipc.Connection()
window = get_previous_window() if args.previous else get_next_window()
window.command('focus')
