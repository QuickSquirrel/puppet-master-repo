node 'slave1.puppet' {

 package { 'httpd':
  ensure => latest,
 }

 service { 'httpd':
  ensure => running,
  enable => true,
 }
 
 service { 'firewalld':
 ensure => stopped,
 enable => false,
 }

 file {'/var/www/html/index.html':
 ensure => file,
 source => 'puppet:///modules/static/index.html'
 }
}

node 'slave2.puppet' {

 package { ['httpd','php'] :
  ensure => latest,
 }

 service { 'httpd':
  ensure => running,
  enable => true,
 }
 
 service { 'firewalld':
 ensure => stopped,
 enable => false,
 }

 file {'/var/www/html/index.php':
 ensure => file,
 source => 'puppet:///modules/dynamic/index.php'
 }
}
