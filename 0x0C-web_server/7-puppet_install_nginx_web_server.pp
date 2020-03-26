# Create a server and configure it

exec { 'Update system':
  path     => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command  => 'sudo apt-get update -y',
  provider => 'shell',
  returns  => [100],
}

exec { 'Install nginx':
  path     => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command  => 'sudo apt-get install nginx -y',
  provider => 'shell',
}

exec { 'Set text in home page':
  path     => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command  => 'echo "Holberton School" | sudo tee /var/www/html/index.nginx-debian.html',
  provider => 'shell',
}
exec { 'Redirect page':
  path     => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command  => 'sudo sed -i "s/server_name _;/\tserver_name _;\n\n\t  location \/redirect_me {\n\treturn 301 youtube.com;\n}\n/" /etc/nginx/sites-available/default',
  provider => 'shell',
}

exec { 'Restart web server':
  path     => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command  => 'sudo service nginx restart',
  provider => 'shell',
}
