class HomeController < ApplicationController
  def index
    @scheduel = @current_user.grade.scheduels.last
    @grade_students = @current_user.grade.students
    
    @user_diary_entries = @current_user.messages.where(message_type: "diary_entry")
    @user_messages = @current_user.messages.where(message_type: "message")
    @user_student_goals = @current_user.student_goals

  end
end
