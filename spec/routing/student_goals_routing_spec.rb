require "rails_helper"

RSpec.describe StudentGoalsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/student_goals").to route_to("student_goals#index")
    end

    it "routes to #new" do
      expect(:get => "/student_goals/new").to route_to("student_goals#new")
    end

    it "routes to #show" do
      expect(:get => "/student_goals/1").to route_to("student_goals#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/student_goals/1/edit").to route_to("student_goals#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/student_goals").to route_to("student_goals#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/student_goals/1").to route_to("student_goals#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/student_goals/1").to route_to("student_goals#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/student_goals/1").to route_to("student_goals#destroy", :id => "1")
    end

  end
end
