# Fix user limit

exec { 'Fix_hard':
  path     => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command  => 'sudo sed -i "s/holberton hard.*/holberton hard nofile 500/"  /etc/security/limits.conf',
  provider => 'shell',
  returns  => [0,1],
}

exec { 'Fix_soft':
  require  => Exec['Fix_hard'],
  path     => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command  => 'sudo sed -i "s/holberton soft.*/holberton soft nofile 400/"  /etc/security/limits.conf',
  provider => 'shell',
  returns  => [0,1],
}
