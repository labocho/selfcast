require "rails_helper"

describe "channels/index" do
  before(:each) do
    allow(view).to receive(:current_user).and_return(User.create!(email: "test@example.com", password: "opensesame"))
    assign(:channels, [
      stub_model(Channel,
        :title => "Title",
        :description => "MyText",
        :image => "Image"
      ),
      stub_model(Channel,
        :title => "Title",
        :description => "MyText",
        :image => "Image"
      )
    ])
  end

  it "renders a list of channels" do
    render
  end
end
