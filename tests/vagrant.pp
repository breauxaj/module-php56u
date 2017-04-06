node default {
  include ::php56u

  Yumrepo <| |> -> Package <| provider != 'rpm' |>

  file { '/var/www/html/index.php':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => '<?php phpinfo(); ?>',
    require => Package['httpd']
  }

  package { 'gcc': ensure => present }
  package { 'gcc-c++': ensure => present }
  package { 'openssl-devel': ensure => present }

  package { 'httpd': ensure => present }

  php56u::config {
    'Date/date.timezone': value => 'America/New_York'
  }

  php56u::modules { 'pecl-xdebug': }

  php56u::pecl { 'newt': require => Package['gcc','gcc-c++','openssl-devel'] }

  php56u::raw { '15-xdebug':
    content => 'zend_extension = xdebug.so
xdebug.max_nesting_level = 150
xdebug.remote_enable = 1
xdebug.remote_port = 9001
xdebug.remote_host = 10.0.2.2
xdebug.idekey = PHPSTORM'
  }

  php56u::raw { '25-memprof':
    content => 'extension=memprof.so'
  }

}
