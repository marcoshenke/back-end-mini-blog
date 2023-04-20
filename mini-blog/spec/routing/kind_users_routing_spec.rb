require "rails_helper"

RSpec.describe KindUsersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/kind_users").to route_to("kind_users#index")
    end

    it "routes to #new" do
      expect(get: "/kind_users/new").to route_to("kind_users#new")
    end

    it "routes to #show" do
      expect(get: "/kind_users/1").to route_to("kind_users#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/kind_users/1/edit").to route_to("kind_users#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/kind_users").to route_to("kind_users#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/kind_users/1").to route_to("kind_users#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/kind_users/1").to route_to("kind_users#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/kind_users/1").to route_to("kind_users#destroy", id: "1")
    end
  end
end
