class build::php73::packages {
  package {[
      'build-essential',
      'libxml2-dev',
      'libssl-dev',
      'libbz2-dev',
      'libzip-dev',
      'libcurl4-openssl-dev',
      'libjpeg-dev',
      'libpng-dev',
      'libjpeg62-turbo-dev',
      'libwebp-dev',
      'libxpm-dev',
      'libmcrypt-dev',
      'libmhash-dev',
      'libmariadbclient-dev-compat',
      'libpspell-dev',
      'autoconf',
      'libsasl2-dev',
      'libldap2-dev',
      'pkg-config',
      'libpq-dev',
      'libreadline-dev',
      'imagemagick',
      'unixodbc',
      'unixodbc-dev',
      'bash-completion'
    ]:
    ensure => present
  }
}
