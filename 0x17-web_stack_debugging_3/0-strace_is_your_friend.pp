exec { 'Fix wp-settings':
  require  => Exec['Set_text'],
  path     => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command  => 'sudo sed -i "s/.phpp/.php/" /var/www/html/wp-settings.php',
  provider => 'shell',
}
