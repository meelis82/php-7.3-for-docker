class build::php74::extensions::redis {
  require build::php74
  require build::php74::extensions::igbinary

  file { '/tmp/redis-3.0.0.tgz':
    ensure => present,
    source => 'puppet:///modules/build/tmp/redis-3.0.0.tgz'
  }

  bash_exec { 'cd /tmp && tar xzf redis-3.0.0.tgz':
    require => File['/tmp/redis-3.0.0.tgz']
  }

  bash_exec { 'cd /tmp/redis-3.0.0 && phpize-7.4.2':
    require => Bash_exec['cd /tmp && tar xzf redis-3.0.0.tgz']
  }

  bash_exec { 'cd /tmp/redis-3.0.0 && ./configure --with-php-config=/usr/local/src/phpfarm/inst/bin/php-config-7.4.2 --enable-redis-igbinary':
    timeout => 0,
    require => Bash_exec['cd /tmp/redis-3.0.0 && phpize-7.4.2']
  }

  bash_exec { 'cd /tmp/redis-3.0.0 && make':
    timeout => 0,
    require => Bash_exec['cd /tmp/redis-3.0.0 && ./configure --with-php-config=/usr/local/src/phpfarm/inst/bin/php-config-7.4.2 --enable-redis-igbinary']
  }

  bash_exec { 'cd /tmp/redis-3.0.0 && make install':
    timeout => 0,
    require => Bash_exec['cd /tmp/redis-3.0.0 && make']
  }
}
