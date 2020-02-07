class build::php74::extensions {
  require build::php74

  include build::php74::extensions::xdebug
  include build::php74::extensions::redis
}
