require "rails_helper"

RSpec.describe ModuleEvaluationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/module_evaluations").to route_to("module_evaluations#index")
    end

    it "routes to #new" do
      expect(:get => "/module_evaluations/new").to route_to("module_evaluations#new")
    end

    it "routes to #show" do
      expect(:get => "/module_evaluations/1").to route_to("module_evaluations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/module_evaluations/1/edit").to route_to("module_evaluations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/module_evaluations").to route_to("module_evaluations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/module_evaluations/1").to route_to("module_evaluations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/module_evaluations/1").to route_to("module_evaluations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/module_evaluations/1").to route_to("module_evaluations#destroy", :id => "1")
    end

  end
end
