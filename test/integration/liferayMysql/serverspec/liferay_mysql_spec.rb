require 'serverspec'

# Required by serverspec
set :backend, :exec

describe "Liferay Service" do

  it "is listening on port 8080" do
    expect(port(8080)).to be_listening
  end

  it "has a running service of liferay" do
    expect(service("liferay")).to be_running
  end

  it "has a running service of mysql" do
    expect(service("mysql")).to be_running
  end

  it "is listening on port 3306" do
    expect(port(3306)).to be_listening
  end

  describe 'mysql driver is referenced in portal properties' do
  @liferay_home = `ls /opt/liferay/`
		@liferay_home.strip!
		@full_path = "/opt/liferay/#{@liferay_home}/portal-ext.properties"
  describe file(@full_path) do 
  	it { 
  		should contain('jdbc.default.driverClassName=com.mysql.jdbc.Driver') }
  end
end

end