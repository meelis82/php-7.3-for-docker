class build::freetype {
  require build::drush::packages;

  file { '/etc/apt/sources.list.d/stretch.list':
    ensure => present,
    source => 'puppet:///modules/build/tmp/stretch.list'
  }

  bash_exec { 'apt-get update && apt-get install --assume-yes --allow-downgrades --no-install-recommends --quiet libfreetype6-dev=2.6.3-3.2 libfreetype6=2.6.3-3.2':
    require => File['/etc/apt/sources.list.d/stretch.list']
  }

  bash_exec { 'rm /etc/apt/sources.list.d/stretch.list':
    require => Bash_exec['apt-get update && apt-get install --assume-yes --allow-downgrades --no-install-recommends --quiet libfreetype6-dev=2.6.3-3.2 libfreetype6=2.6.3-3.2']
  }
}