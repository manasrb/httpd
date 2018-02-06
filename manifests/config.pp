class httpd::config {

  file{ '/tmp/bobsled.zip':

    ensure => file,
    source => 'puppet:///modules/httpd/bobsled.zip',
    notify => Exec['unzip'],

}
  file { '/var/www/html':

    ensure => directory,
    owner   => root,
    mode   => '0755',

}
 
 file { '/etc/httpd/conf/httpd.conf':
 
     ensure => file,
     source => 'puppet:///modules/httpd/httpd.conf',
     notify => Service['httpd'], 
}    
 

  exec { 'unzip':

    command     => '/bin/unzip /tmp/bobsled.zip -d /var/www/html',
    user        =>  root,
    require     =>  File['/var/www/html'],
    refreshonly =>  true,

}

} 
