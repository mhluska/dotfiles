dep 'how2.npm'
dep 'pyenv.lib'

dep 'dotfiles' do
  requires 'homebrew', 'tmux.src', 'how2.npm', 'pyenv.lib'
end
