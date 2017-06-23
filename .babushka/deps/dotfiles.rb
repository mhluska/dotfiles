meta :cloned do
  accepts_value_for :repo
  accepts_value_for :destination

  template {
    met? { destination.to_fancypath.exists? && shell("(cd #{destination} && git remote -v)")[repo] }
    meet { shell "git clone #{repo} #{destination}" }
  }
end

dep 'zsh.bin'
dep 'npm.bin'

dep 'node.lib' do
  installs {
    via :brew, 'node'
    otherwise 'nodejs'
  }
end

dep 'oh-my-zsh.cloned' do
  requires 'zsh.bin'
  repo 'git://github.com/robbyrussell/oh-my-zsh.git'
  destination '~/.oh-my-zsh'
end

dep 'dotfiles' do
  requires 'tmux.src', 'oh-my-zsh.cloned', 'node.lib', 'npm.bin'
end
