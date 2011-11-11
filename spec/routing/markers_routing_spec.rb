require "spec_helper"

describe MarkersController do
  describe "routing" do

    it "routes to #index" do
      get("/markers").should route_to("markers#index")
    end

    it "routes to #new" do
      get("/markers/new").should route_to("markers#new")
    end

    it "routes to #show" do
      get("/markers/1").should route_to("markers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/markers/1/edit").should route_to("markers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/markers").should route_to("markers#create")
    end

    it "routes to #update" do
      put("/markers/1").should route_to("markers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/markers/1").should route_to("markers#destroy", :id => "1")
    end

  end
end
