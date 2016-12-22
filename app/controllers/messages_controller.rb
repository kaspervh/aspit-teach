class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  

  def index
   ap @messages = @current_user.messages.where(message_type: "message")
  end

  def show
    @message = Message.find(params[:id])
    if message_user = @message.message_users.find_by(user_id: @current_user.id)
      message_user.mark_as_read
     else
      flash[:error] = "Du har ikke adgang til beskeden"
      redirect_to root_path
    end
    @comment = Comment.new
  end

  def new
    @message = Message.new
  end

  def edit
  end

  def create
    params.permit!   
    message_user_ids = params[:message][:message_user_ids]
    params[:message].delete :message_user_ids
    @message = Message.new(message_params)
    respond_to do |format|
      if @message.save 
        message_user_ids.reject!{|s| s.empty?}
        message_user_ids.map!{|s| s.to_i} - [0]
        @message.create_readers(@current_user, message_user_ids)
        format.html { redirect_to messages_path, notice: 'Message was successfully created.' }
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
        format.html { redirect_to @message, notice: 'Diary entry was successfully updated.' }
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
      format.html { redirect_to diary_entries_url, notice: 'Diary entry was successfully destroyed.' }
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
