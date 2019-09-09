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
      'libmcrypt-dev',
      'libmhash-dev',
      'libmariadbclient-dev-compat',
      'libpspell-dev',
      'autoconf',
      'libcloog-ppl1',
      'libsasl2-dev',
      'libldap2-dev',
      'pkg-config',
      'libpq-dev',
      'libreadline-dev',
      'libfreetype6-dev',
      'imagemagick',
      'unixodbc',
      'unixodbc-dev'
    ]:
    ensure => present
  }
}
