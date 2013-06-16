require 'spec_helper'

describe "channels/edit" do
  before(:each) do
    @channel = assign(:channel, stub_model(Channel,
      :title => "MyString",
      :description => "MyText",
      :image => "MyString"
    ))
  end

  it "renders the edit channel form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", channel_path(@channel), "post" do
      assert_select "input#channel_title[name=?]", "channel[title]"
      assert_select "textarea#channel_description[name=?]", "channel[description]"
      assert_select "input#channel_image[name=?]", "channel[image]"
    end
  end
end
