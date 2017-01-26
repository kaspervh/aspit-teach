require 'rails_helper'

RSpec.describe "StudentGoals", type: :request do
  describe "GET /student_goals" do
    it "works! (now write some real specs)" do
      get student_goals_path
      expect(response).to have_http_status(200)
    end
  end
end
