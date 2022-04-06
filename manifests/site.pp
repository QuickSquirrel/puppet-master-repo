node 'slave1.puppet', 'slave2.puppet' {

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
 source => 'master.puppet:///files/static/index.html'
 }


 
# file { '/var/www/html/index.html':
# ensure => file,
# content => '<html>
#  <head>
#    <title>Success!</title>
#  </head>
#  <body>
#    You Vagrantfile is fine if you can see this message.
#  </body>
#</html>',
# }
 
}
