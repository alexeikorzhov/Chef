# # encoding: utf-8

# Inspec test for recipe task1_community::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  describe user('root'), :skip do
    it { should exist }
  end
end

describe package('net-tools') do
  it { should be_installed }
end

describe bash('netstat -putnl') do
  its('stdout') { should match /tcp/ }
  its('exit_status') { should eq 0 }
end
