require "rails_helper"

describe "items/show" do
  before(:each) do
    @channel = Channel.create!(title: "new channel")
    @item = assign(:item, stub_model(Item,
      :channel => @channel,
      :title => "Title",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end
