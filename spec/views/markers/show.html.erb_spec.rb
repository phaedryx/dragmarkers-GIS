require 'spec_helper'

describe "markers/show.html.erb" do
  before(:each) do
    @marker = assign(:marker, stub_model(Marker))
  end

  it "renders attributes in <p>" do
    render
  end
end
