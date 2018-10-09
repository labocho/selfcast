require 'spec_helper'

describe "Items" do
  describe "GET /items" do
    it "works! (now write some real specs)" do
      sign_in User.create!(email: "test@example.com", password: "opensesame")
      channel = Channel.create!(title: "new channel")
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get channel_items_path(channel)
      response.status.should be(200)
    end
  end
end
