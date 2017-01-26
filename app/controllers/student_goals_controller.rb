class StudentGoalsController < ApplicationController
  before_action :set_student_goal, only: [:show, :edit, :update, :destroy]

  # GET /student_goals
  # GET /student_goals.json
  def index
    @student_goals = StudentGoal.all
  end

  # GET /student_goals/1
  # GET /student_goals/1.json
  def show
  end

  # GET /student_goals/new
  def new
    @student_goal = StudentGoal.new
  end

  # GET /student_goals/1/edit
  def edit
  end

  # POST /student_goals
  # POST /student_goals.json
  def create
    @student_goal = StudentGoal.new(student_goal_params)

    respond_to do |format|
      if @student_goal.save
        @student_goal.create_student_goal_readers(@current_user)
        format.html { redirect_to @student_goal, notice: 'Student goal was successfully created.' }
        format.json { render :show, status: :created, location: @student_goal }
      else
        format.html { render :new }
        format.json { render json: @student_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_goals/1
  # PATCH/PUT /student_goals/1.json
  def update
    respond_to do |format|
      if @student_goal.update(student_goal_params)
        format.html { redirect_to @student_goal, notice: 'Student goal was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_goal }
      else
        format.html { render :edit }
        format.json { render json: @student_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_goals/1
  # DELETE /student_goals/1.json
  def destroy
    @student_goal.destroy
    respond_to do |format|
      format.html { redirect_to student_goals_url, notice: 'Student goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_goal
      @student_goal = StudentGoal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_goal_params
      params.require(:student_goal).permit(:user_id, :goal_name, :main_goal, :learning_goal, :fufillment_tools, :fufillment_criteria, :beginning_score, :resolved)
    end
end
