class build::php73::extensions::xdebug {
  require build::php73

  file { '/tmp/xdebug-2.7.0RC2.tgz':
    ensure => present,
    source => 'puppet:///modules/build/tmp/xdebug-2.7.0RC2.tgz'
  }

  bash_exec { 'cd /tmp && tar xzf xdebug-2.7.0RC2.tgz':
    require => File['/tmp/xdebug-2.7.0RC2.tgz']
  }

  bash_exec { 'cd /tmp/xdebug-2.7.0RC2 && phpize-7.3.7':
    require => Bash_exec['cd /tmp && tar xzf xdebug-2.7.0RC2.tgz']
  }

  bash_exec { 'cd /tmp/xdebug-2.7.0RC2 && ./configure --with-php-config=/usr/local/src/phpfarm/inst/bin/php-config-7.3.7':
    timeout => 0,
    require => Bash_exec['cd /tmp/xdebug-2.7.0RC2 && phpize-7.3.7']
  }

  bash_exec { 'cd /tmp/xdebug-2.7.0RC2 && make':
    timeout => 0,
    require => Bash_exec['cd /tmp/xdebug-2.7.0RC2 && ./configure --with-php-config=/usr/local/src/phpfarm/inst/bin/php-config-7.3.7']
  }

  bash_exec { 'cd /tmp/xdebug-2.7.0RC2 && make install':
    timeout => 0,
    require => Bash_exec['cd /tmp/xdebug-2.7.0RC2 && make']
  }
}
