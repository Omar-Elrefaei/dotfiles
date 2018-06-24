echo ".myconf" >> .gitignore
git clone --bare github.com/Omar-Elrefaei/dotfiles $HOME/.myconf
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
config checkout
config config --local status.showUntrackedFiles no
