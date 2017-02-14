require 'rails_helper'

RSpec.describe "StudentGoalEvaluations", type: :request do
  describe "GET /student_goal_evaluations" do
    it "works! (now write some real specs)" do
      get student_goal_evaluations_path
      expect(response).to have_http_status(200)
    end
  end
end
