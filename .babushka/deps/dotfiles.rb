meta :cloned do
  accepts_value_for :repo
  accepts_value_for :destination

  template {
    met? { destination.to_fancypath.exists? && shell("(cd #{destination} && git remote -v)")[repo] }
    meet { shell "git clone #{repo} #{destination}" }
  }
end

dep 'how2.npm'
dep 'pyenv.lib'

dep 'oh-my-zsh.cloned' do
  repo 'git://github.com/robbyrussell/oh-my-zsh.git'
  destination '~/.oh-my-zsh'
end

dep 'dotfiles' do
  requires 'homebrew', 'tmux.src', 'how2.npm', 'pyenv.lib', 'oh-my-zsh.cloned'
end
