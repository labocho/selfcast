require "rails_helper"

describe "items/index" do
  before(:each) do
    @query = ItemQuery.new
    @channel = Channel.create!(title: "new channel")
    assign(:items, Kaminari.paginate_array([
      stub_model(Item,
        :channel => @channel,
        :title => "Title",
        :description => "MyText"
      ),
      stub_model(Item,
        :channel => @channel,
        :title => "Title",
        :description => "MyText"
      )
    ]).page(0).per(10))
  end

  it "renders a list of items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "h2", :text => "Title".to_s, :count => 2
  end
end
