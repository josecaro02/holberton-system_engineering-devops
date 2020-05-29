# Fix limit requests
exec { 'Fix limit reqyest':
  path     => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command  => 'sudo sed -i "s/15/200/" /etc/default/nginx',
  provider => 'shell',
}
