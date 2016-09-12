dep 'libevent-dev.lib' do
  installs {
    via :brew, 'libevent'
    otherwise 'libevent-dev'
  }
end

dep 'reattach-to-user-namespace.bin', for: :osx
dep 'automake.bin', for: :osx
dep 'pkg-config.bin', for: :osx

dep 'tmux.src' do
  requires 'libevent-dev.lib', 'reattach-to-user-namespace.bin',
    'automake.bin', 'pkg-config.bin'

  provides 'tmux ~> 2.2'
  source 'https://github.com/tmux/tmux/tarball/2.2'

  preconfigure { shell('./autogen.sh && ./configure') }

  met? { shell('command -v tmux >/dev/null && tmux -V') == 'tmux 2.2'}
end
