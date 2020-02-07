class build::drush {
  require build::user
  require build::php74
  require build::php74::extensions
  require build::composer
  require build::drush::packages

  bash_exec { "su - container -c 'mkdir /home/container/.drush'": }

  include build::drush::drush8
}
