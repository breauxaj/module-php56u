define php56u::raw (
  $ensure = present,
  $content
) {
  include ::php56u

  file { "/etc/php.d/${name}.ini":
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => $content,
    require => Package[$::php56u::params::php_packages],
  }

}