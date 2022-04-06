node 'slave1.puppet', 'slave2.puppet' {

 package { 'httpd':
  ensure => latest,
 }

 service { 'httpd':
  ensure => running,
  enable => true,
 }
}


node slave1.puppet {
 file {'/var/www/html/index.html':
  ensure => file,
  source => 'puppet:///modules/static/index.html'
 }
}

node slave2.puppet {

 package { 'php':
  ensure => latest,
 }

 file {'/var/www/html/index.php':
  ensure => file,
  source => 'puppet:///modules/dynamic/index.php'
 }
}
