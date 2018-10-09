require "spec_helper"

describe ItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/channels/1/items").should route_to("items#index", channel_id: "1")
    end

    it "routes to #new" do
      get("/channels/1/items/new").should route_to("items#new", channel_id: "1")
    end

    it "routes to #show" do
      get("/channels/1/items/2").should route_to("items#show", channel_id: "1", id: "2")
    end

    it "routes to #edit" do
      get("/channels/1/items/2/edit").should route_to("items#edit", channel_id: "1", id: "2")
    end

    it "routes to #create" do
      post("/channels/1/items").should route_to("items#create", channel_id: "1")
    end

    it "routes to #update" do
      put("/channels/1/items/2").should route_to("items#update", channel_id: "1", id: "2")
    end

    it "routes to #destroy" do
      delete("/channels/1/items/2").should route_to("items#destroy", channel_id: "1", id: "2")
    end

  end
end
