# KILL a process named 'kill me now'
exec { 'kill process':
  path     => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command  => 'pkill killmenow',
  provider => 'shell',
}