This is a git repo.

    git clone git@github.com:barneydesmond/bashrcd.git ~/.bashrc.d

Symlink to the RC files, from your homedir:

    ln -s ~/.bashrc.d/bash_profile ~/.bash_profile
    ln -s ~/.bashrc.d/bashrc       ~/.bashrc
    ln -s ~/.bashrc.d/profile      ~/.profile

You might need to delete the default .bashrc and .profile first.
