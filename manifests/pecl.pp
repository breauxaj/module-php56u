define php56u::pecl (
  $ensure = $::php56u::params::php_package_ensure
) {
  include ::php56u

  $extension = $title

  package { $extension:
    ensure   => $ensure,
    provider => 'pecl',
    require  => Package[$::php56u::params::php_packages],
  } ~> Exec['php-apachectl-restart']

}
