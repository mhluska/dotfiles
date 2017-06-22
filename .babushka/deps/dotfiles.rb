meta :cloned do
  accepts_value_for :repo
  accepts_value_for :destination

  template {
    met? { destination.to_fancypath.exists? && shell("(cd #{destination} && git remote -v)")[repo] }
    meet { shell "git clone #{repo} #{destination}" }
  }
end

dep 'zsh.bin'
dep 'node.bin'
dep 'npm.bin'

dep 'oh-my-zsh.cloned' do
  requires 'zsh.bin'
  repo 'git://github.com/robbyrussell/oh-my-zsh.git'
  destination '~/.oh-my-zsh'
end

dep 'dotfiles' do
  requires 'tmux.src', 'oh-my-zsh.cloned', 'node.bin', 'npm.bin'
end
