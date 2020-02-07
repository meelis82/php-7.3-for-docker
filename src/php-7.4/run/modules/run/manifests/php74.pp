class run::php74 {
  file { '/usr/local/src/phpfarm/inst/current/etc/php-fpm.d/www.conf':
    ensure => present,
    content => template('run/www.conf.erb'),
    mode => "644"
  }

  include run::php74::ini::realpath_cache_size
  include run::php74::ini::realpath_cache_ttl
  include run::php74::ini::timezone
  include run::php74::ini::post_max_size
  include run::php74::ini::upload_max_filesize
  include run::php74::ini::short_open_tag
  include run::php74::ini::max_execution_time
  include run::php74::ini::max_input_vars
  include run::php74::ini::memory_limit
  include run::php74::ini::display_errors
  include run::php74::ini::display_startup_errors
  include run::php74::ini::error_reporting
  include run::php74::ini::expose_php
  include run::php74::ini::allow_url_fopen
  include run::php74::ini::sys_temp_dir

  if $php_ini_opcache == "On" {
    include run::php74::ini::opcache
  }

  if $php_ini_xdebug == "On" {
    include run::php74::ini::xdebug
  }

  if $php_ini_redis == "On" {
    include run::php74::ini::redis
  }
}
