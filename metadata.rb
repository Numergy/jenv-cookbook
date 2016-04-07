name 'jenv'
maintainer 'Numergy'
maintainer_email 'khai-wen.tran@numergy.com'
license 'All rights reserved'
description 'Installs/Configures jenv'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.4.0'

depends 'apt'
depends 'git'

source_url 'https://github.com/Numergy/jenv-cookbook' if
  respond_to?(:source_url)
issues_url 'https://github.com/Numergy/jenv-cookbook/issues' if
  respond_to?(:issues_url)
