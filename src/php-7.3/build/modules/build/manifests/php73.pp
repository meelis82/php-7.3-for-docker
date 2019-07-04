class build::php73 {
  require build::php73::packages
  require build::php73::supervisor
  require build::phpfarm

  bash_exec { 'mkdir -p /usr/local/src/phpfarm/inst/php-7.3.7/etc/conf.d': }

  bash_exec { 'mkdir -p /usr/local/src/phpfarm/inst/php-7.3.7/etc/fpm.d': }

  bash_exec { 'mkdir -p /usr/local/src/phpfarm/inst/php-7.3.7/etc/pool.d': }

  file { '/tmp/php-7.3.7.tar.gz':
    ensure => present,
    source => 'puppet:///modules/build/tmp/php-7.3.7.tar.gz'
  }

  bash_exec { 'cd /tmp && tar xzf php-7.3.7.tar.gz':
    require => File['/tmp/php-7.3.7.tar.gz']
  }

  bash_exec { 'mv /tmp/php-7.3.7 /usr/local/src/phpfarm/src/php-7.3.7':
    require => Bash_exec['cd /tmp && tar xzf php-7.3.7.tar.gz']
  }

  file { '/usr/local/src/phpfarm/src/custom/options-7.3.7.sh':
    ensure => present,
    source => 'puppet:///modules/build/usr/local/src/phpfarm/src/custom/options-7.3.7.sh',
    mode => "755",
    require => Bash_exec['mv /tmp/php-7.3.7 /usr/local/src/phpfarm/src/php-7.3.7']
  }

  bash_exec { '/usr/local/src/phpfarm/src/main.sh 7.3.7':
    timeout => 0,
    require => File['/usr/local/src/phpfarm/src/custom/options-7.3.7.sh']
  }

  bash_exec { 'rm -rf /usr/local/src/phpfarm/src/php-7.3.7':
    require => Bash_exec['/usr/local/src/phpfarm/src/main.sh 7.3.7']
  }

  file { '/usr/local/src/phpfarm/inst/php-7.3.7/etc/php-fpm.conf':
    ensure => present,
    source => 'puppet:///modules/build/usr/local/src/phpfarm/inst/php-7.3.7/etc/php-fpm.conf',
    mode => "644",
    require => Bash_exec['/usr/local/src/phpfarm/src/main.sh 7.3.7']
  }

  bash_exec { 'switch-phpfarm 7.3.7':
    require => Bash_exec['/usr/local/src/phpfarm/src/main.sh 7.3.7']
  }
}
