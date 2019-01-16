class clean {

  bash_exec { 'apt-get remove -y build-essential autoconf autocmake': }

  bash_exec { 'apt-get autoremove':
    'require' => bash_exec[ 'apt-get remove -y build-essential autoconf autocmake' ]
  }

  bash_exec { 'apt-get clean':
    'require' => bash_exec[ 'apt-get autoremove' ]
  }

  bash_exec { 'rm -rf /tmp/*': }

  bash_exec { 'rm -rf /var/lib/apt/lists/*': }
}
