define php56u::pecl (
  $ensure = $::php56u::params::php_package_ensure
) {
  include ::php56u

  $ext = $title

  package { $ext:
    ensure   => $ensure,
    provider => 'pecl',
    require  => Package[$::php56u::params::php_packages],
  }

}
