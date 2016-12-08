class CommentsController < ApplicationController

  def index
    @commentable.comments

  def new
    @comment = Comment.new
  end

  def create
    ap params
    @comment = Comment.new comment_params
    if @comment.save!
      redirect_to :back, notice: "Din kommentar er blevet oprettet"
    else
      redirect_to :back, notice: "kunne ikke gemme din kommetar"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type)
  end
end