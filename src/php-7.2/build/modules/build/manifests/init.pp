class build {
  require build::user

  include build::php72
  include build::php72::extensions
  include build::composer
  include build::drush
  include build::postfix
  include build::cron
  include build::drupal_console
  include build::mysql
}
