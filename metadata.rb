maintainer       "Klaus Meyer"
maintainer_email "spam@klaus-meyer.net"
license          "Apache 2.0"
description      "Installs/Configures railo"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

recipe "railo", "Installs railo"

depends "apache2", ">= 0.99.4"

%w{ debian }.each do |os|
  supports os
end