class run::drush::drush8 {
  require run::user

  if $drush_version == '8' {
    file { '/usr/local/bin/drush':
      ensure => link,
      target => '/usr/local/src/drush8/drush'
    }

    file { '/etc/bash_completion.d':
      ensure => directory,
    }

    file { '/etc/bash_completion.d/drush.complete.sh':
      ensure => link,
      target => '/usr/local/src/drush8/drush.complete.sh',
      require => File['/etc/bash_completion.d']
    }

    bash_exec { "chown -R -h $user_id /usr/local/src/drush8": }
    bash_exec { "chgrp -R -h $group_id /usr/local/src/drush8": }
  }
}
