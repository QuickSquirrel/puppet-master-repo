node 'slave1.puppet', 'slave2.puppet' {

 package { 'httpd':
  ensure => latest,
 }

 service { 'httpd':
  ensure => running,
  enable => true,
 }
  
 file {'/var/www/html/index.html':
 ensure => file,
 source => 'puppet:///modules/static/index.html'
 }
}
