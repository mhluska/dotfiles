dep 'tmux.src' do
  requires 'libevent-dev.lib', 'reattach-to-user-namespace.homebrew'
  provides 'tmux ~> 2.2'
  source 'https://github.com/tmux/tmux/tarball/2.2'

  preconfigure { shell('./autogen.sh && ./configure') }

  met? { shell('command -v tmux >/dev/null && tmux -V') == 'tmux 2.2'}
end
