class build::drush::packages {
  package {[
      'lsb-release',
      'gnupg',
    ]:
    ensure => present
  }

  file { '/opt/mysql-apt-config_0.8.10-1_all.deb':
    ensure => present,
    source => 'puppet:///modules/build/tmp/mysql-apt-config_0.8.10-1_all.deb',
    mode => "644"
  }

  package { "mysql-apt-config_0.8.10-1_all":
    provider => dpkg,
    ensure => installed,
    source => "/opt/mysql-apt-config_0.8.10-1_all.deb",
    require => File['/opt/mysql-apt-config_0.8.10-1_all.deb']
  }

  Bash_exec { 'apt-key adv --keyserver keys.gnupg.net --recv-keys 8C718D3B5072E1F5':
    require => Package['mysql-apt-config_0.8.10-1_all']
  }

  File{ '/opt/mysql_install.sh':
    ensure => present,
    source => 'puppet:///modules/build/tmp/mysql_install.sh',
    mode => "755",
    require => Bash_exec['apt-key adv --keyserver keys.gnupg.net --recv-keys 8C718D3B5072E1F5']
  }

  Bash_exec { '/opt/mysql_install.sh': }

  File { '/var/lib/mysql':
    require => Bash_exec['/opt/mysql_install.sh'],
    ensure => absent,
    force => true
  }

  Bash_exec { 'rm -f /opt/mysql-apt-config_0.8.10-1_all.deb':
    require => Bash_exec['/opt/mysql_install.sh'],
  }

  Bash_exec { 'rm -f /opt/mysql_install.sh':
    require => Bash_exec['/opt/mysql_install.sh'],
  }
}
