class build::php71::extensions {
  require build::php71

  include build::php71::extensions::xdebug
  include build::php71::extensions::memcached
  include build::php71::extensions::redis
}
