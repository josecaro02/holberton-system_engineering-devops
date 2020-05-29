# Fix limit requests
exec { 'Fix limit reqyest':
  path     => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command  => 'sudo sed -i "s/UNLIMIT=.*/UNLIMIT=\"-n 200\"/"  /etc/default/nginx',
  provider => 'shell',
}
