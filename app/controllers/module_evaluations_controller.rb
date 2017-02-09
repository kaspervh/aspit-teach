class ModuleEvaluationsController < ApplicationController
  before_action :set_module_evaluation, only: [:show, :edit, :update, :destroy]

  # GET /module_evaluations
  # GET /module_evaluations.json
  def index
    @module_evaluations = ModuleEvaluation.all
  end

  # GET /module_evaluations/1
  # GET /module_evaluations/1.json
  def show
  end

  # GET /module_evaluations/new
  def new
    @module_evaluation = ModuleEvaluation.new
  end

  # GET /module_evaluations/1/edit
  def edit
  end

  # POST /module_evaluations
  # POST /module_evaluations.json
  def create
    @module_evaluation = ModuleEvaluation.new(module_evaluation_params)
    respond_to do |format|
      if @module_evaluation.save
        format.html { redirect_to root_path, notice: 'Modul evaluering er gemt.' }
        format.json { render :show, status: :created, location: @module_evaluation }
      else
        format.html { render :new }
        format.json { render json: @module_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /module_evaluations/1
  # PATCH/PUT /module_evaluations/1.json
  def update
    respond_to do |format|
      if @module_evaluation.update(module_evaluation_params)
        format.html { redirect_to redirect_to root_path, notice: 'Modul evaluering er blevet opdateret.' }
        format.json { render :show, status: :ok, location: @module_evaluation }
      else
        format.html { render :edit }
        format.json { render json: @module_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /module_evaluations/1
  # DELETE /module_evaluations/1.json
  def destroy
    @module_evaluation.destroy
    respond_to do |format|
      format.html { redirect_to module_evaluations_url, notice: 'Modul evaluering er blevet gemt.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_module_evaluation
      @module_evaluation = ModuleEvaluation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def module_evaluation_params
      params.require(:module_evaluation).permit(:module_name, :module_score, :evaluation_explanation)
    end
end
