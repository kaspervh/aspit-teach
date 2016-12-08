class GradeScheduelsController < ApplicationController
  before_action :set_grade_scheduel, only: [:show, :edit, :update, :destroy]

  # GET /grade_scheduels
  # GET /grade_scheduels.json
  def index
    @grade_scheduels = GradeScheduel.all
  end

  # GET /grade_scheduels/1
  # GET /grade_scheduels/1.json
  def show
  end

  # GET /grade_scheduels/new
  def new
    @grade_scheduel = GradeScheduel.new
  end

  # GET /grade_scheduels/1/edit
  def edit
  end

  # POST /grade_scheduels
  # POST /grade_scheduels.json
  def create
    @grade_scheduel = GradeScheduel.new(grade_scheduel_params)

    respond_to do |format|
      if @grade_scheduel.save
        format.html { redirect_to @grade_scheduel, notice: 'Grade scheduel was successfully created.' }
        format.json { render :show, status: :created, location: @grade_scheduel }
      else
        format.html { render :new }
        format.json { render json: @grade_scheduel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grade_scheduels/1
  # PATCH/PUT /grade_scheduels/1.json
  def update
    respond_to do |format|
      if @grade_scheduel.update(grade_scheduel_params)
        format.html { redirect_to @grade_scheduel, notice: 'Grade scheduel was successfully updated.' }
        format.json { render :show, status: :ok, location: @grade_scheduel }
      else
        format.html { render :edit }
        format.json { render json: @grade_scheduel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grade_scheduels/1
  # DELETE /grade_scheduels/1.json
  def destroy
    @grade_scheduel.destroy
    respond_to do |format|
      format.html { redirect_to grade_scheduels_url, notice: 'Grade scheduel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade_scheduel
      @grade_scheduel = GradeScheduel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_scheduel_params
      params.require(:grade_scheduel).permit(:image, :week_number)
    end
end
