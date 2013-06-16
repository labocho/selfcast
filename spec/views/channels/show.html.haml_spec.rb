require 'spec_helper'

describe "channels/show" do
  before(:each) do
    @channel = assign(:channel, stub_model(Channel,
      :title => "Title",
      :description => "MyText",
      :image => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/Image/)
  end
end
