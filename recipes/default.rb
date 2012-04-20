#
# Author:: Klaus Meyer (spam@klaus-meyer.net)
# Cookbook Name:: railo
# Attributes:: railo
#
# Copyright 2012, Klaus Meyer
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "apache2"

remote_file "#{Chef::Config[:file_cache_path]}/railo-3.3.1.000-pl1-linux-installer.run" do
  source "http://www.getrailo.org/railo/remote/download/3.3.1.000/tomcat/linux/railo-3.3.1.000-pl1-linux-installer.run"
  mode "0744"
  action :create_if_missing
end

execute "railo_installer" do
  command_string = <<-FOO
    /usr/bin/sudo #{Chef::Config[:file_cache_path]}/railo-3.3.1.000-pl1-linux-installer.run \
          --mode unattended \
          --prefix /opt/railo/ \
          --tomcatuser railo \
          --tomcatpass railoadmin \
          --tomcatport 8888 \
          --systemuser railo \
          --startatboot yes \
          --installconn yes \
          --apachever 22 \
          --apachecontrolloc /etc/init.d/apache2 \
          --apachemodulesloc /usr/lib/apache2/modules \
          --apachelogloc /var/log/apache2 \
          --bittype 32
    FOO
  command command_string
  action :run
end

