import os
import subprocess
import filecmp
import shutil
import fileinput
from os import walk


def Choose_package_manager():
    f = []
    for (root, dirs, files) in walk('/etc'):
        f.extend(dirs)
        break
    package_manager_list = [['apt', 'install'], ['pacman', '-S']]
    #  package_manager_list = [['apt', 'install']]
    for i in range(len(package_manager_list)):
        manager = package_manager_list[i][0]
        if next((manager for s in f if manager in s), None)!=None:
            package_manager=package_manager_list[i][0]+' '+package_manager_list[i][1]

    shutil.copy('./setup.sh', 'temp_setup.sh')
    for line in fileinput.input(r'./temp_setup.sh', inplace=1):
        print(line.replace('package manager', package_manager), end='')


def Setup():
    if os.path.exists('/bin/zsh')!=True:
        Choose_package_manager()
        os.system('sh ./temp_setup.sh')
        os.remove('./temp_setup.sh')

def Sysnc():
    snippets_list=['/.emacs.d/private/snippets/','/.vim/UltiSnips/']
    for i in snippets_list:
        local_path=os.getenv('HOME')+i
        dotfiles_path=os.getcwd()+'/'+i.split('/')[-2]+'/'
        cmd='rsync -avrz '+local_path+' '+dotfiles_path
        subprocess.call(cmd,shell=True)
    file_list=[['/.spacevim','./spacevim'],
              ['/.zshrc','./zshrc'],
              ['/.tmux.conf','./tmux.conf'],
              ['/.spacemacs','./spacemacs']]
    for i in range(len(file_list)):
       if filecmp.cmp(os.getenv('HOME')+file_list[i][0],file_list[i][1])!=True:
           shutil.copy(os.getenv('HOME')+file_list[i][0],file_list[i][1])
           
def main():
    Setup()
    Sysnc()

if __name__ == '__main__':
    main()
