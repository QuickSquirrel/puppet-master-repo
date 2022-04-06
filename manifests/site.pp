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

 file {'/var/www/html/index.html':
 ensure => file,
 source => 'puppet:///modules/static/index.html'
 }
}

node 'slave2.puppet' {

 package { 'php' :
  ensure => latest,
 }

 file {'/var/www/html/index.php':
 ensure => file,
 source => 'puppet:///modules/dynamic/index.php'
 }
}
