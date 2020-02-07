class build::php74 {
  require build::php74::packages
  require build::freetype
  require build::php74::supervisor
  require build::phpfarm
  require build::freetds

  bash_exec { 'mkdir -p /usr/local/src/phpfarm/inst/php-7.4.2/etc/conf.d': }

  bash_exec { 'mkdir -p /usr/local/src/phpfarm/inst/php-7.4.2/etc/fpm.d': }

  bash_exec { 'mkdir -p /usr/local/src/phpfarm/inst/php-7.4.2/etc/pool.d': }

  file { '/tmp/php-7.4.2.tar.gz':
    ensure => present,
    source => 'puppet:///modules/build/tmp/php-7.4.2.tar.gz'
  }

  bash_exec { 'cd /tmp && tar xzf php-7.4.2.tar.gz':
    require => File['/tmp/php-7.4.2.tar.gz']
  }

  bash_exec { 'mv /tmp/php-7.4.2 /usr/local/src/phpfarm/src/php-7.4.2':
    require => Bash_exec['cd /tmp && tar xzf php-7.4.2.tar.gz']
  }

  file { '/usr/local/src/phpfarm/src/custom/options-7.4.2.sh':
    ensure => present,
    source => 'puppet:///modules/build/usr/local/src/phpfarm/src/custom/options-7.4.2.sh',
    mode => "755",
    require => Bash_exec['mv /tmp/php-7.4.2 /usr/local/src/phpfarm/src/php-7.4.2']
  }

  bash_exec { '/usr/local/src/phpfarm/src/main.sh 7.4.2':
    timeout => 0,
    require => File['/usr/local/src/phpfarm/src/custom/options-7.4.2.sh']
  }

  bash_exec { 'rm -rf /usr/local/src/phpfarm/src/php-7.4.2':
    require => Bash_exec['/usr/local/src/phpfarm/src/main.sh 7.4.2']
  }

  file { '/usr/local/src/phpfarm/inst/php-7.4.2/etc/php-fpm.conf':
    ensure => present,
    source => 'puppet:///modules/build/usr/local/src/phpfarm/inst/php-7.4.2/etc/php-fpm.conf',
    mode => "644",
    require => Bash_exec['/usr/local/src/phpfarm/src/main.sh 7.4.2']
  }

  bash_exec { 'switch-phpfarm 7.4.2':
    require => Bash_exec['/usr/local/src/phpfarm/src/main.sh 7.4.2']
  }
}
