node /^slave\d.pappet/{

 package { 'httpd':
  ensure => latest,
 }

 service { 'httpd':
  ensure => running,
  enable => true,
 }
}


