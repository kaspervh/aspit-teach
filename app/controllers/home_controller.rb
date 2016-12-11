class HomeController < ApplicationController
	def index
		@scheduel = @current_user.grade.scheduels.last
    @grade_students = @current_user.grade.students
	end
end
