node default {

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

}

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
}
