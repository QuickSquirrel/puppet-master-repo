node 'slave1.puppet', 'slave2.puppet' {

 package { 'httpd':
  ensure => latest,
 }

 service { 'httpd':
  ensure => running,
  enable => true,
 }
}


