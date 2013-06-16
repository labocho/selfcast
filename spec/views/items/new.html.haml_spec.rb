require 'spec_helper'

describe "items/new" do
  before(:each) do
    assign(:item, stub_model(Item,
      :channel => nil,
      :title => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", items_path, "post" do
      assert_select "input#item_channel[name=?]", "item[channel]"
      assert_select "input#item_title[name=?]", "item[title]"
      assert_select "textarea#item_description[name=?]", "item[description]"
    end
  end
end
