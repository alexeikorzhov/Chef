#
# Cookbook Name:: jbossas7
# Recipe:: configuration
#
# Copyright 2012
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

package 'java-1.8.0-openjdk-devel'
package 'unzip'

bash "Installation Jboss/WildFly" do
  code <<-SHELL
  cd /opt/
  wget http://download.jboss.org/wildfly/10.1.0.Final/wildfly-10.1.0.Final.zip
  unzip wildfly-10.1.0.Final.zip
  mv /opt/wildfly-10.1.0.Final /opt/wildfly
  rm -rf /opt/wildfly-10.1.0.Final
  sed -i 's;127.0.0.1;192.168.56.12;g' /opt/wildfly/standalone/configuration/standalone.xml
  SHELL
end

template '/opt/wildfly/standalone/deployments/helloworld.war' do
  source 'helloworld.war'
end

template "/etc/systemd/system/wildfly.service" do
  source "wildfly.service.erb"
end

service 'wildfly' do
  action [:enable,:start]
  supports :reload => true
end


bash 'deploy' do
  code <<-SHELL
  sleep 60
  SHELL
end







