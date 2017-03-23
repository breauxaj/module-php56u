define php56u::pecl (
  $ensure = $::php56u::params::php_package_ensure
) {
  include ::php56u

  $ext = $title

  exec { 'pecl-update-channels':
    command => '/usr/bin/pecl update-channels',
    timeout => 10000,
    before  => Package[$ext]
  }

  package { $ext:
    ensure   => $ensure,
    provider => 'pecl'
  }

}
