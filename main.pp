file { '/tmp/xyz.txt':
  ensure  => present,
  mode    => '0666',
  content => "Here is my Public IP Address: ${ipaddress_eth0}.\n",
}

package { 'vim':
  ensure => installed,
}

package { 'apache2':
  ensure => installed,
}

service { 'apache2':
  ensure => running,
}

file { '/var/www/html/info.php':
  ensure => file,
  content => '<?php  phpinfo(); ?>',
  require => Package['apache2'],
}
