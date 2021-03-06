dep 'libevent-dev.lib' do
  installs {
    via :brew, 'libevent'
    otherwise 'libevent-dev'
  }
end

dep 'reattach-to-user-namespace.bin', for: :osx
dep 'automake.bin', for: :osx
dep 'pkg-config.bin'

dep 'ncurses.lib' do
  installs {
    via :brew, 'ncurses'
    otherwise 'libncurses5-dev', 'libncursesw5-dev'
  }
end

dep 'tmux.src' do
  requires 'ncurses.lib', 'libevent-dev.lib', 'reattach-to-user-namespace.bin',
    'automake.bin', 'pkg-config.bin'

  provides 'tmux ~> 2.5'
  source 'https://github.com/tmux/tmux/tarball/2.5'

  preconfigure { shell('./autogen.sh && ./configure') }

  met? { shell('command -v tmux >/dev/null && tmux -V') == 'tmux 2.5'}
end
