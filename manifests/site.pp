node 'slave1.puppet' {

 package { 'httpd':
  ensure => latest,
 }

 file {'/var/www/html/index.html':
  ensure => file,
  source => 'puppet:///modules/static/index.html'
 }

 service { 'httpd':
  ensure => running,
  enable => true,
 }

 file {'/root/README':
  ensure => absente,
 }
}

node 'slave2.puppet' {

 package { ['httpd','php'] :
  ensure => latest,
 }

 file {'/var/www/html/index.php':
  ensure => file,
  source => 'puppet:///modules/dynamic/index.php'
 }
 
 service { 'httpd':
  ensure => running,
  enable => true,
 }
 
 firewalld_rich_rule { 'Accept HTTP from any':
  ensure => present,
  zone   => 'restricted',
  service => 'http',
  action  => 'accept',
 }
 
 file {'/root/README':
  ensure => absente,
 }
}
