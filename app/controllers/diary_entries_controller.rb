class DiaryEntriesController < ApplicationController
  before_action :set_diary_entry, only: [:show, :edit, :update, :destroy]

  # GET /diary_entries
  # GET /diary_entries.json
  def index
    @diary_entries = @current_user.messages.where(message_type: "diary_entry")
    ap @diary_entries
  end

  # GET /diary_entries/1
  # GET /diary_entries/1.json
   def show
     if message_user = @diary_entry.message_users.where(user_id: @current_user.id).first
      message_user.mark_as_read
     else
      ""
     end

     @comment = Comment.new
  end

  # GET /diary_entries/new
  def new
    @diary_entry = Message.new
  end

  # GET /diary_entries/1/edit
  def edit
  end

  # POST /diary_entries
  # POST /diary_entries.json
  def create
    @diary_entry = Message.new(diary_entry_params)
    respond_to do |format|
      if @diary_entry.save
        @diary_entry.create_diary_entry_users(@current_user)
        format.html { redirect_to @diary_entry, notice: 'Diary entry was successfully created.' }
        format.json { render :show, status: :created, location: @diary_entry }
      else
        format.html { render :new }
        format.json { render json: @diary_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diary_entries/1
  # PATCH/PUT /diary_entries/1.json
  def update
    respond_to do |format|
      if @diary_entry.update(diary_entry_params)
        format.html { redirect_to @diary_entry, notice: 'Diary entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @diary_entry }
      else
        format.html { render :edit }
        format.json { render json: @diary_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diary_entries/1
  # DELETE /diary_entries/1.json
  def destroy
    @diary_entry.destroy
    respond_to do |format|
      format.html { redirect_to diary_entries_url, notice: 'Diary entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diary_entry
      @diary_entry = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diary_entry_params
      params.require(:message).permit!
    end
end
