class build::freetds {
  file { '/tmp/freetds-1.1.15.tar.gz':
    ensure => present,
    source => 'puppet:///modules/build/tmp/freetds-1.1.15.tar.gz'
  }

  bash_exec { 'cd /tmp && tar xzf freetds-1.1.15.tar.gz':
    require => File['/tmp/freetds-1.1.15.tar.gz']
  }

  bash_exec { 'cd /tmp/freetds-1.1.15 && ./configure --prefix=/usr/local/freetds --enable-msdblib':
    timeout => 0,
    require => Bash_exec['cd /tmp && tar xzf freetds-1.1.15.tar.gz']
  }

  bash_exec { 'cd /tmp/freetds-1.1.15 && make':
    timeout => 0,
    require => Bash_exec['cd /tmp/freetds-1.1.15 && ./configure --prefix=/usr/local/freetds --enable-msdblib']
  }

  bash_exec { 'cd /tmp/freetds-1.1.15 && make install':
    timeout => 0,
    require => Bash_exec['cd /tmp/freetds-1.1.15 && make']
  }

  file { '/usr/lib/x86_64-linux-gnu/libsybdb.so.5':
    ensure => link,
    target => '/usr/local/freetds/lib/libsybdb.so.5',
    require => Bash_exec['cd /tmp/freetds-0.1.1.15 && make install']
  }

  bash_exec { 'mkdir -p /usr/local/freetds/lib/x86_64-linux-gnu':
    require => File['/usr/lib/x86_64-linux-gnu/libsybdb.so.5']
  }

  file { '/usr/local/freetds/lib/x86_64-linux-gnu/libsybdb.so':
    ensure => link,
    target => '/usr/local/freetds/lib/libsybdb.so.5',
    require => Bash_exec['mkdir -p /usr/local/freetds/lib/x86_64-linux-gnu']
  }

  bash_exec { 'echo "include /usr/local/freetds/lib" >> /etc/ld.so.conf':
    require => File['/usr/local/freetds/lib/x86_64-linux-gnu/libsybdb.so']
  }

  bash_exec { 'ldconfig -v':
    require => Bash_exec['echo "include /usr/local/freetds/lib" >> /etc/ld.so.conf']
  }
}
