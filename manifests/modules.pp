define php56u::modules (
  $ensure = $::php56u::params::php_package_ensure
) {
  include ::php56u

  $required = $title

  package { "php56u-${required}":
    ensure  => $ensure,
  }

}
