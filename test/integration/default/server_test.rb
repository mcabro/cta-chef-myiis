# # encoding: utf-8

# Inspec test for recipe myiis::server

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.


######## TEST CONFIGURATION ########

describe service('w3svc') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

######## TEST PROMISE ########
describe port(80) do
  it { should be_listening }
end
#describe port(80), :skip do
#  it { should_not be_listening }
#end

describe http('localhost') do
  its('status') { should eq 200 }
  its('headers.Content-Type') { should include 'text/html' }
  its('body') { should include 'Hello, world!(chef style)' }
end
