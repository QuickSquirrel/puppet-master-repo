node 'slave1.puppet', 'slave2.puppet' {

 package { 'httpd':
  ensure => latest,
 }

 service { 'httpd':
  ensure => running,
  enable => true,
 }
 
 
 file { '/var/www/html/info.html':
 ensure => file,
 content => '<html>
  <head>
    <title>Success!</title>
  </head>
  <body>
    You Vagrantfile is fine if you can see this message.
  </body>
</html>',
 }
 
}
