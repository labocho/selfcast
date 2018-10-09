require "rails_helper"

describe "Channels" do
  describe "GET /channels" do
    it "works! (now write some real specs)" do
      sign_in User.create!(email: "test@example.com", password: "opensesame")
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get channels_path
      response.status.should be(200)
    end
  end
end
