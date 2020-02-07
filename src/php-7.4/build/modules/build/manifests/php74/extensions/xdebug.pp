class build::php74::extensions::xdebug {
  require build::php74

  file { '/tmp/xdebug-2.7.2.tgz':
    ensure => present,
    source => 'puppet:///modules/build/tmp/xdebug-2.7.2.tgz'
  }

  bash_exec { 'cd /tmp && tar xzf xdebug-2.7.2.tgz':
    require => File['/tmp/xdebug-2.7.2.tgz']
  }

  bash_exec { 'cd /tmp/xdebug-2.7.2 && phpize-7.4.2':
    require => Bash_exec['cd /tmp && tar xzf xdebug-2.7.2.tgz']
  }

  bash_exec { 'cd /tmp/xdebug-2.7.2 && ./configure --with-php-config=/usr/local/src/phpfarm/inst/bin/php-config-7.4.2':
    timeout => 0,
    require => Bash_exec['cd /tmp/xdebug-2.7.2 && phpize-7.4.2']
  }

  bash_exec { 'cd /tmp/xdebug-2.7.2 && make':
    timeout => 0,
    require => Bash_exec['cd /tmp/xdebug-2.7.2 && ./configure --with-php-config=/usr/local/src/phpfarm/inst/bin/php-config-7.4.2']
  }

  bash_exec { 'cd /tmp/xdebug-2.7.2 && make install':
    timeout => 0,
    require => Bash_exec['cd /tmp/xdebug-2.7.2 && make']
  }
}
