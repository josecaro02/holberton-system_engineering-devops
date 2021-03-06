# Create a server and configure it

exec { 'Update_system':
  path     => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command  => 'sudo apt-get update -y',
  provider => 'shell',
  returns  => [0,1],
}

exec { 'Install_nginx':
  require  => Exec['Update_system'],
  path     => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command  => 'sudo apt-get install nginx -y',
  provider => 'shell',
  returns  => [0,1],
}

exec { 'Set_text':
  require  => Exec['Install_nginx'],
  path     => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command  => 'echo "Holberton School" | sudo tee /var/www/html/index.nginx-debian.html',
  provider => 'shell',
  returns  => [0,1],
}
exec { 'Redirect_page':
  require  => Exec['Set_text'],
  path     => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command  => 'sudo sed -i "s/server_name _;/\tserver_name _;\n\n\t  location \/redirect_me {\n\treturn 301 youtube.com;\n}\n/" /etc/nginx/sites-available/default',
  provider => 'shell',
  returns  => [0,1],
}

exec { 'Restart_web_server':
  require  => Exec['Redirect_page'],
  path     => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command  => 'sudo service nginx restart',
  provider => 'shell',
  returns  => [0,1],
}
