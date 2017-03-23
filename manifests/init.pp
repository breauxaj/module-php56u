# Class: php56u
#
# This class installs PHP 5.6 from IUS
#
# Parameters:
#
#  ensure: (default latest)
#    Determine which version to install
#
# Actions:
#   - Install PHP 5.6
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'php56u': }
#
class php56u (
  $ensure = $::php56u::params::php_package_ensure
) inherits ::php56u::params {
  package { $::php56u::params::php_packages:
    ensure  => $ensure
  }

  $config = hiera_hash('php',{})
  create_resources('php56u::config',$config)

  $modules = hiera_hash('php::modules',{})
  create_resources('php56u::modules',$modules)

  $pecl = hiera_hash('php::pecl',{})
  create_resources('php56u::pecl',$pecl)

  $raw = hiera_hash('php::raw',{})
  create_resources('php56u::raw',$raw)

}
