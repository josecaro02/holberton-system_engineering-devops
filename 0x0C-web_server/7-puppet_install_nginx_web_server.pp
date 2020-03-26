# Create a server and configure it
$new_string = "\tserver_name _;\n\n\t location /redirect_me {\n\treturn 301 youtube.com;\n}\n"

exec { 'Update system':
  path     => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command  => 'apt-get update -y',
  provider => 'shell',
}

exec { 'Install nginx':
  path     => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command  => 'apt-get install nginx -y',
  provider => 'shell',
}

exec { 'Set text in home page':
  path     => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command  => 'echo "Holberton School" > /var/www/html/index.nginx-debian.html',
  provider => 'shell',
}
exec { 'Redirect page':
  path     => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command  => 'sed -i "s/server_name _;/$new_string/" /etc/nginx/sites-available/default',
  provider => 'shell',
}

exec { 'Restart web server':
  path     => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command  => 'service nginx restart',
  provider => 'shell',
}
