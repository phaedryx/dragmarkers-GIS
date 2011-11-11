require 'spec_helper'

describe "markers/index.html.erb" do
  before(:each) do
    assign(:markers, [
      stub_model(Marker),
      stub_model(Marker)
    ])
  end

  it "renders a list of markers" do
    render
  end
end
