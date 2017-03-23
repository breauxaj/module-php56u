php56u
======

An alternative installation of PHP from IUS.

Samples
-------
```
include php56u
```
```
php56u::config {
  'Date/date.timezone': value => 'America/New_York';
}
```
```
php56u::modules { 'bcmath': ensure => 'latest', }
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com