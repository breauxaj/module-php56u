define php56u::config (
  $value
) {
  include ::php56u

  $key = $title

  $context = '/files/etc/php.ini'

  augeas { "php_ini/${key}":
    context => $context,
    onlyif  => "get ${key} != '${value}'",
    changes => "set ${key} '${value}'",
    require => Package[$::php56u::params::php_packages],
  } ~> Exec['php-apachectl-restart']

}
