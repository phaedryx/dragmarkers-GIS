require 'spec_helper'

describe "markers/edit.html.erb" do
  before(:each) do
    @marker = assign(:marker, stub_model(Marker))
  end

  it "renders the edit marker form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => markers_path(@marker), :method => "post" do
    end
  end
end
