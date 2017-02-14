require "rails_helper"

RSpec.describe StudentGoalEvaluationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/student_goal_evaluations").to route_to("student_goal_evaluations#index")
    end

    it "routes to #new" do
      expect(:get => "/student_goal_evaluations/new").to route_to("student_goal_evaluations#new")
    end

    it "routes to #show" do
      expect(:get => "/student_goal_evaluations/1").to route_to("student_goal_evaluations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/student_goal_evaluations/1/edit").to route_to("student_goal_evaluations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/student_goal_evaluations").to route_to("student_goal_evaluations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/student_goal_evaluations/1").to route_to("student_goal_evaluations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/student_goal_evaluations/1").to route_to("student_goal_evaluations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/student_goal_evaluations/1").to route_to("student_goal_evaluations#destroy", :id => "1")
    end

  end
end
