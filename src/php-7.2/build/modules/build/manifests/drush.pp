class build::drush {
  require build::user
  require build::php72
  require build::php72::extensions
  require build::composer
  require build::drush::packages

  bash_exec { "su - container -c 'mkdir /home/container/.drush'": }

  include build::drush::drush8
}
