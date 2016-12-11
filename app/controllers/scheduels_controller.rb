class ScheduelsController < ApplicationController
  before_action :set_scheduel, only: [:show, :edit, :update, :destroy]
  before_action :set_grade
  # GET /scheduels
  # GET /scheduels.json
  def index
    @scheduels = Scheduel.all
  end

  # GET /scheduels/1
  # GET /scheduels/1.json
  def show
  end

  # GET /scheduels/new
  def new

    @scheduel = @grade.scheduels.new()
  end

  # GET /scheduels/1/edit
  def edit
  end

  # POST /scheduels
  # POST /scheduels.json
  def create
    @scheduel = @grade.scheduels.new(scheduel_params)

    respond_to do |format|
      if @scheduel.save
        format.html { redirect_to root_path, notice: 'Scheduel was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /scheduels/1
  # PATCH/PUT /scheduels/1.json
  def update
    respond_to do |format|
      if @scheduel.update(scheduel_params)
        format.html { redirect_to root_path, notice: 'Scheduel was successfully updated.' }

      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /scheduels/1
  # DELETE /scheduels/1.json
  def destroy
    @scheduel.destroy
    respond_to do |format|
      format.html { redirect_to grade_shedules_path(@grade), notice: 'Scheduel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scheduel
      @scheduel = Scheduel.find(params[:id])
    end

    def set_grade
      @grade = Grade.find(params[:grade_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def scheduel_params
      params.require(:scheduel).permit(:image, :grade_id)
    end
end
