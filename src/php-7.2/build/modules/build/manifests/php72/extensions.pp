class build::php72::extensions {
  require build::php72

  include build::php72::extensions::xdebug
  include build::php72::extensions::redis
}
