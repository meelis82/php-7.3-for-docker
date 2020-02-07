class run::freetds {
  file { '/usr/local/freetds/etc/freetds.conf':
    ensure => present,
    content => template('run/freetds.conf.erb'),
    mode => "644"
  }

    file { '/etc/odbc.ini':
      ensure => present,
      content => template('run/odbc.ini.erb'),
      mode => "644"
    }
}