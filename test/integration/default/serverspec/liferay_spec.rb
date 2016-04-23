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

end