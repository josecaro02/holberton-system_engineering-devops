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

exec { 'Add_header':
  require  => Eect['Redirect_page'],
  path     => ['/usr/bin', '/sbin', '/usr/sbin'],
  command  => 'sudo sed -i "s/http {/http {\n\tadd_header X-Served-By \$hostname;\n/" /etc/nginx/nginx.conf',
  provider => 'shell',
  returns  => [0,1],
}

exec { 'start_web_server':
  require  => Exec['Add_header'],
  path     => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command  => 'sudo service nginx start',
  provider => 'shell',
  returns  => [0,1],
}
