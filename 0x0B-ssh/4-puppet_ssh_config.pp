# Puppet that edits ssh_config file
    file_line { 'passwd_authentication':
      path  => '/etc/ssh/ssh_config',
      line  => '    PasswordAuthentication no',
      match => '    PasswordAuthentication',
    }

    file_line { 'Identity file':
      path  => '/etc/ssh/ssh_config',
      line  => '    IdentityFile ~/.ssh/holberton',
      match => '    IdentityFile',
    }