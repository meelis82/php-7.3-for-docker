class build::php73 {
  require build::php73::packages
  require build::php73::supervisor
  require build::phpfarm
  require build::freetds

  bash_exec { 'mkdir -p /usr/local/src/phpfarm/inst/php-7.3.8/etc/conf.d': }

  bash_exec { 'mkdir -p /usr/local/src/phpfarm/inst/php-7.3.8/etc/fpm.d': }

  bash_exec { 'mkdir -p /usr/local/src/phpfarm/inst/php-7.3.8/etc/pool.d': }

  file { '/tmp/php-7.3.8.tar.gz':
    ensure => present,
    source => 'puppet:///modules/build/tmp/php-7.3.8.tar.gz'
  }

  bash_exec { 'cd /tmp && tar xzf php-7.3.8.tar.gz':
    require => File['/tmp/php-7.3.8.tar.gz']
  }

  bash_exec { 'mv /tmp/php-7.3.8 /usr/local/src/phpfarm/src/php-7.3.8':
    require => Bash_exec['cd /tmp && tar xzf php-7.3.8.tar.gz']
  }

  file { '/usr/local/src/phpfarm/src/custom/options-7.3.8.sh':
    ensure => present,
    source => 'puppet:///modules/build/usr/local/src/phpfarm/src/custom/options-7.3.8.sh',
    mode => "755",
    require => Bash_exec['mv /tmp/php-7.3.8 /usr/local/src/phpfarm/src/php-7.3.8']
  }

  bash_exec { '/usr/local/src/phpfarm/src/main.sh 7.3.8':
    timeout => 0,
    require => File['/usr/local/src/phpfarm/src/custom/options-7.3.8.sh']
  }

  bash_exec { 'rm -rf /usr/local/src/phpfarm/src/php-7.3.8':
    require => Bash_exec['/usr/local/src/phpfarm/src/main.sh 7.3.8']
  }

  file { '/usr/local/src/phpfarm/inst/php-7.3.8/etc/php-fpm.conf':
    ensure => present,
    source => 'puppet:///modules/build/usr/local/src/phpfarm/inst/php-7.3.8/etc/php-fpm.conf',
    mode => "644",
    require => Bash_exec['/usr/local/src/phpfarm/src/main.sh 7.3.8']
  }

  bash_exec { 'switch-phpfarm 7.3.8':
    require => Bash_exec['/usr/local/src/phpfarm/src/main.sh 7.3.8']
  }
}
