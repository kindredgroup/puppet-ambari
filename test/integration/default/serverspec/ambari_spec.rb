require 'serverspec'

set :backend, :exec

describe 'service ambari-server' do
  it "should be running" do
    expect(service('ambari-server')).to be_running
  end
  it "should be enabled" do
    expect(service('ambari-server')).to be_enabled.with_level(3)
  end
end
