class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  

  def index
   ap @messages = @current_user.messages.where(message_type: "message")
  end

  def show
    @message = Message.find(params[:id])
    if reader = @message.readers.find_by(user_id: @current_user.id)
      reader.mark_as_read
     else
      flash[:error] = "Du har ikke adgang til beskeden"
      redirect_to root_path
    end
    @comment = Comment.new
  end

  def new
    @message = @current_user.messages.new
    @school_students = @current_user.school.students
    @everyone_else = @current_user.school.teachers_admins_mentors
  end

  def edit
  end

  def create
    params.permit!   
    reader_ids = params[:message][:reader_ids]
    params[:message].delete :reader_ids
    @message = Message.new(message_params)
    respond_to do |format|
      if @message.save 
        reader_ids.reject!{|s| s.empty?}
        reader_ids.map!{|s| s.to_i} - [0]
        @message.create_readers(@current_user, reader_ids)
        format.html { redirect_to root_path, notice: 'Beskeden er gemt.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @message.update(diary_entry_params)
        format.html { redirect_to root_path, notice: 'Beskeden er opdateret' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @diary_entry.destroy
    respond_to do |format|
      format.html { redirect_to diary_entries_url, notice: 'Besked er slettet' }
      format.json { head :no_content }
    end
  end


  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit!
  end
end
