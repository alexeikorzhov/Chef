# # encoding: utf-8

# Inspec test for recipe task1_jboss::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe port(80), :skip do
  it { should_not be_listening }
end

describe package('java-1.8.0-openjdk-devel') do
  it { should be_installed }
end

describe file('/opt/wildfly') do
 its('type') { should eq :directory }
 it { should be_directory }
end

describe file('/opt/wildfly/standalone/deployments/helloworld.war') do
 it { should exist }
end

describe file('/etc/systemd/system/wildfly.service') do
 it { should exist }
end

describe service('wildfly') do
  it { should be_enabled }
  it { should be_running }
end

describe http('http://192.168.56.12:8080/helloworld/hi.jsp') do
  its('status') { should eq 200 }
end
