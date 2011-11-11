require 'spec_helper'

describe "markers/new.html.erb" do
  before(:each) do
    assign(:marker, stub_model(Marker).as_new_record)
  end

  it "renders new marker form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => markers_path, :method => "post" do
    end
  end
end
