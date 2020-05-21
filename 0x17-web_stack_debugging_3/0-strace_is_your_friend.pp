# Fix wp-settings
exec { 'Fix wp-settings':
  path     => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command  => 'sudo sed -i "s/.phpp/.php/" /var/www/html/wp-settings.php',
  provider => 'shell',
}
