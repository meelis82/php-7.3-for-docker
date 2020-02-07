class run::php74::ini::sys_temp_dir {
  file { '/usr/local/src/phpfarm/inst/current/etc/conf.d/sys_temp_dir.ini':
    ensure => present,
    content => template('run/php74/ini/sys_temp_dir.ini.erb'),
    mode => "644"
  }
}
