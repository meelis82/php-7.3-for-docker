class build {
  require build::user

  include build::php74
  include build::php74::extensions
  include build::freetds
  include build::composer
  include build::drush
  include build::postfix
  include build::cron
  include build::drupal_console
  include build::mysql
}
