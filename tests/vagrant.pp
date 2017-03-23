node default {
  include ::php56u
  Yumrepo <| |> -> Package <| provider != 'rpm' |>

  package { 'gcc': ensure => 'present' }
  package { 'httpd': ensure => 'present' }
  package { 'openssl-devel': ensure => 'present' }
  
  php56u::pecl { 'xdebug': ensure => 'present' }

}
