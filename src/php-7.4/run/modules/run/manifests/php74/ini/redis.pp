class run::php74::ini::redis {
  file { '/usr/local/src/phpfarm/inst/current/etc/conf.d/redis.ini':
    ensure => present,
    content => template('run/php74/ini/redis.ini.erb'),
    mode => "644"
  }
}
