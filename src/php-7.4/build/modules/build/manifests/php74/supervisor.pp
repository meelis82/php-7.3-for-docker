class build::php74::supervisor {
  file { '/etc/supervisor/conf.d/php.conf':
    ensure => present,
    source => 'puppet:///modules/build/etc/supervisor/conf.d/php.conf',
    mode => "644"
  }

  class build::supervisor {
    file { '/etc/supervisor/conf.d/supervisord.conf':
      ensure => present,
      source => 'puppet:///modules/build/etc/supervisor/conf.d/supervisord.conf',
      mode => "644"
    }
  }

}
