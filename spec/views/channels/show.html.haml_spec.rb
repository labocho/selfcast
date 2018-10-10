require "rails_helper"

describe "channels/show" do
  before(:each) do
    allow(view).to receive(:current_user).and_return(User.create!(email: "test@example.com", password: "opensesame"))
    @channel = assign(
      :channel,
      stub_model(
        Channel,
        title: "Title",
        description: "MyText",
        image: "Image",
      ),
    )
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end
