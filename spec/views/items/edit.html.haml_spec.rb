require 'spec_helper'

describe "items/edit" do
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :channel => nil,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", item_path(@item), "post" do
      assert_select "input#item_channel[name=?]", "item[channel]"
      assert_select "input#item_title[name=?]", "item[title]"
      assert_select "textarea#item_description[name=?]", "item[description]"
    end
  end
end
