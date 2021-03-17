#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
from ranger.api.commands import Command
import re


# https://github.com/ranger/ranger/wiki/Integrating-File-Search-with-fzf
# Now, simply bind this function to a key, by adding this to your ~/.config/ranger/rc.conf: map <C-f> fzf_select
class fzf_select(Command):
    """
    :fzf_select

    Find a file using fzf.

    With a prefix argument select only directories.

    See: https://github.com/junegunn/fzf
    """

    def execute(self):
        import subprocess
        if self.quantifier:
            # match only directories
            command = "find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
            -o -type d -print 2> /dev/null | sed 1d | cut -b3- | fzf +m"

        else:
            # match files and directories
            command = "find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
            -o -print 2> /dev/null | sed 1d | cut -b3- | fzf +m"

        fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)


class mkcd(Command):
    """
    :mkcd <dirname>

    Creates a directory with the name <dirname> and enters it.
    """

    def execute(self):
        from os.path import join, expanduser, lexists
        from os import makedirs
        import re

        dirname = join(self.fm.thisdir.path, expanduser(self.rest(1)))
        if not lexists(dirname):
            makedirs(dirname)

            match = re.search('^/|^~[^/]*/', dirname)
            print(match)
            if match:
                self.fm.cd(match.group(0))
                dirname = dirname[match.end(0):]

            for m in re.finditer('[^/]+', dirname):
                s = m.group(0)
                if s == '..' or (s.startswith('.')
                                 and not self.fm.settings['show_hidden']):
                    self.fm.cd(s)
                else:
                    self.fm.thisdir.load_content(schedule=False)
                    self.fm.execute_console('scout -ae ^{}$'.format(s))
        else:
            self.fm.notify("file/directory exists!", bad=True)


class newfile_with_shebang(Command):
    def execute(self):
        from os.path import join, expanduser, lexists
        from os import mknod

        filename = join(self.fm.thisdir.path, expanduser(self.rest(1)))
        if not lexists(filename):
            mknod(filename)
            all_shebang = {
                "c": "#include <stdio.h>",
                "sh": "#!/usr/bin/env bash",
                "cpp": "#include <iostream>\nusing namespace std;",
                "py": "#!/usr/bin/env python\n# -*- coding: utf-8 -*-"
            }

            if all_shebang.get(filename.split(".")[-1]):
                f = open(filename, 'w')
                f.write(all_shebang.get(filename.split(".")[-1]))
                f.close()
            self.fm.execute_console('edit '+filename)

        else:
            self.fm.notify("file/directory exists!", bad=True)


class extract(Command):
    """:extract <paths>

    Extract archives using 7z
    """

    def execute(self):
        fail = []
        for i in self.fm.thistab.get_selection():
            path = i.path
            file = os.path.basename(path)
            shell = None
            if re.match(".*(\.tar\.gz|\.tgz)$", file):
                shell = 'tar zxvf "{0}"'.format(path)
            elif re.match(".*(\.tar\.bz2|\.tbz|\.tbz2)$", file):
                shell = 'tar xvjf "{0}"'.format(path)
            elif re.match(".*(\.tar\.xz|\.txz)$", file):
                shell = 'tar xJvf "{0}"'.format(path)
            elif re.match(".*\.tar$", file):
                shell = 'tar xvf "{0}"'.format(path)
            elif re.match(
                ".*(\.zip|\.war|\.jar|\.sublime-package|\.ipsw|\.xpi|\.apk|\.aar|\.whl)$",
                file,
            ):
                shell = 'unzip "{0}" -d "{1}"'.format(path, os.path.splitext(path)[0])
            elif re.match(".*\.rar"):
                shell = 'unrar x -ad "{0}"'.format(path)
            elif re.match(".*\.7z"):
                shell = '7za x "{0}"'.format(path)

            if not shell or os.system(shell):
                fail.append(i.path)
        if len(fail) > 0:
            self.fm.notify(
                "Fail to extract: {0}".format(" ".join(fail)), duration=10, bad=True
            )
        self.fm.redraw_window()
