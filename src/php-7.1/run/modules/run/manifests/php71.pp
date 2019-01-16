class run::php71 {
  file { '/usr/local/src/phpfarm/inst/current/etc/php-fpm.d/www.conf':
    ensure => present,
    content => template('run/www.conf.erb'),
    mode => 644
  }

  include run::php71::ini::realpath_cache_size
  include run::php71::ini::realpath_cache_ttl
  include run::php71::ini::timezone
  include run::php71::ini::post_max_size
  include run::php71::ini::upload_max_filesize
  include run::php71::ini::short_open_tag
  include run::php71::ini::max_execution_time
  include run::php71::ini::max_input_vars
  include run::php71::ini::memory_limit
  include run::php71::ini::display_errors
  include run::php71::ini::display_startup_errors
  include run::php71::ini::error_reporting
  include run::php71::ini::expose_php
  include run::php71::ini::allow_url_fopen
  include run::php71::ini::sys_temp_dir

  if $php_ini_opcache == "On" {
    include run::php71::ini::opcache
  }

  if $php_ini_xdebug == "On" {
    include run::php71::ini::xdebug
  }

  if $php_ini_memcached == "On" {
    include run::php71::ini::memcached
  }

  if $php_ini_redis == "On" {
    include run::php71::ini::redis
  }
}
