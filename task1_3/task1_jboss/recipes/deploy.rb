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

package 'unzip'

bash "Deploy war/jar" do
  code <<-SHELL
  cd /opt/
  wget http://centerkey.com/jboss/HelloWorldWebApp.zip
  unzip /opt/HelloWorldWebApp.zip -d /opt/wildfly/standalone/deployments/ 
  rm -rf /opt/HelloWorldWebApp.zip/
  SHELL
#  action :nothing  
  notifies :restart, 'service[wildfly]', :immediately
end




