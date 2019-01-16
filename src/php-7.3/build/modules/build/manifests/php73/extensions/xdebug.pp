class build::php73::extensions::xdebug {
  require build::php73

  file { '/tmp/xdebug-2.7.0beta1.tgz':
    ensure => present,
    source => 'puppet:///modules/build/tmp/xdebug-2.7.0beta1.tgz'
  }

  bash_exec { 'cd /tmp && tar xzf xdebug-2.7.0beta1.tgz':
    require => File['/tmp/xdebug-2.7.0beta1.tgz']
  }

  bash_exec { 'cd /tmp/xdebug-2.7.0beta1 && phpize-7.3.1':
    require => Bash_exec['cd /tmp && tar xzf xdebug-2.7.0beta1.tgz']
  }

  bash_exec { 'cd /tmp/xdebug-2.7.0beta1 && ./configure --with-php-config=/usr/local/src/phpfarm/inst/bin/php-config-7.3.1':
    timeout => 0,
    require => Bash_exec['cd /tmp/xdebug-2.7.0beta1 && phpize-7.3.1']
  }

  bash_exec { 'cd /tmp/xdebug-2.7.0beta1 && make':
    timeout => 0,
    require => Bash_exec['cd /tmp/2.7.0beta1 && ./configure --with-php-config=/usr/local/src/phpfarm/inst/bin/php-config-7.3.1']
  }

  bash_exec { 'cd /tmp/2.7.0beta1 && make install':
    timeout => 0,
    require => Bash_exec['cd /tmp/2.7.0beta1 && make']
  }
}
