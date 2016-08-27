dep 'libevent-dev.lib' do
  installs {
    via :brew, 'libevent'
    otherwise 'libevent-dev'
  }
end
