# Fix limit requests
exec { 'Fix_limit':
  path     => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command  => 'sudo sed -i "s/ULIMIT=.*/ULIMIT=\"-n 2000\"/"  /etc/default/nginx',
  provider => 'shell',
  returns  => [0,1],
}


exec { 'Restart_nginx':
  require  => Exec['Fix_limit'],
  path     => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command  => 'sudo service nginx restart',
  provider => 'shell',
  returns  => [0,1],
}
