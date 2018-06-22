class CommentsController < ApplicationController

  def create
    @comment = Comment.new
    @comment.name = params[:comment][:name]
    @comment.message = params[:comment][:message]
    @comment.picture_id = params[:picture_id]

    if @comment.save
      flash[:success] = "Comment added!"
      redirect_to picture_path(params[:picture_id])
    else
      redirect_to picture_path(params[:picture_id])
    end
  end

  def edit
    @comment = Comment.find(params(:id))
    @comment.name = params[:review][:name]
    @comment.message = params[:review][:message]
    @comment.picture_id = params[:picture_id]
  end

  def destroy
    @review = Comment.find(params[:id])
    @review.delete
    flash[:notice] = "Review sucessfully deleted"
    redirect_to picture_path(params[:picture_id])
  end

end
