class build {
  require build::user

  include build::php73
  include build::php73::extensions
  include build::composer
  include build::drush
  include build::postfix
  include build::cron
  include build::drupal_console
  include build::mysql
}
