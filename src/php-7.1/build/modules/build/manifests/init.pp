class build {
  require build::user

  include build::php71
  include build::php71::extensions
  include build::composer
  include build::drush
  include build::postfix
  include build::cron
  include build::drupal_console
  include build::mysql
}
