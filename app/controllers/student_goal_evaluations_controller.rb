class StudentGoalEvaluationsController < ApplicationController
  before_action :set_student_goal_evaluation, only: [:show, :edit, :update, :destroy]

  # GET /student_goal_evaluations
  # GET /student_goal_evaluations.json
  def index
    @student_goal_evaluations = StudentGoalEvaluation.all
  end

  # GET /student_goal_evaluations/1
  # GET /student_goal_evaluations/1.json
  def show
  end

  # GET /student_goal_evaluations/new
  def new
    @student_goal_evaluation = StudentGoalEvaluation.new
    @student_goal = StudentGoal.find(params[:student_goal_id])
  end

  # GET /student_goal_evaluations/1/edit
  def edit
    @student_goal = StudentGoal.find(params[:student_goal_id])
  end

  # POST /student_goal_evaluations
  # POST /student_goal_evaluations.json
  def create
    @student_goal_evaluation = StudentGoalEvaluation.new(student_goal_evaluation_params)

    respond_to do |format|
      if @student_goal_evaluation.save
        format.html { redirect_to root_path, notice: 'Evalueringen er gemt.' }
        format.json { render :show, status: :created, location: @student_goal_evaluation }
      else
        format.html { render :new }
        format.json { render json: @student_goal_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_goal_evaluations/1
  # PATCH/PUT /student_goal_evaluations/1.json
  def update
    respond_to do |format|
      if @student_goal_evaluation.update(student_goal_evaluation_params)
        format.html { redirect_to root_path, notice: 'Evalueringen er opdateret.' }
        format.json { render :show, status: :ok, location: @student_goal_evaluation }
      else
        format.html { render :edit }
        format.json { render json: @student_goal_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_goal_evaluations/1
  # DELETE /student_goal_evaluations/1.json
  def destroy
    @student_goal_evaluation.destroy
    respond_to do |format|
      format.html { redirect_to student_goal_evaluations_url, notice: 'Evalueringen er slettet.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_goal_evaluation
      @student_goal_evaluation = StudentGoalEvaluation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_goal_evaluation_params
      params.require(:student_goal_evaluation).permit(:student_goal_id, :goal_evaluation, :achivement_tools_evaluation, :intermediate_score)
    end
end
