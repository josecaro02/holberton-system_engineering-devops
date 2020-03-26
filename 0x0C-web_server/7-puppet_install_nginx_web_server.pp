# Create a server and configure it
$new_string = "\tserver_name _;\n\n\t location \/redirect_me {\n\treturn 301 youtube.com;\n}\n"
$my_string = "server_name _;\n\terror_page 404 \/custom_404.html;\nlocation =
	    \/custom_404.html {\nroot \/usr\/share\/nginx\/html;\ninternal;\n}\n"
exec {
  path => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command => 'apt-get update -y'
  provider => 'shell',
}

exec {
  path => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command => 'apt-get install nginx -y'
  provider => 'shell',
}

exec {
  path => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command => 'echo "Holberton School" > /var/www/html/index.nginx-debian.html',
  provider => 'shell',
}
exec {
  path => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command => 'sed -i "s/server_name _;/$new_string/" /etc/nginx/sites-available/default',
  provider => 'shell',
}

exec {
  path => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
  command => 'echo "Ceci n'est pas une page" > /usr/share/nginx/html/custom_404.htmly',
  provider => 'shell',
}

exec {
     path => ['/usr/bin', '/sbin', '/bin', '/usr/sbin'],
     command => 'sed -i \"s/server_name _;/$my_string',
     provide => 'shell',
}