class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]


def create
  @pin = Pin.find(params[:pin_id])
  @comment = @pin.comments.create(comment_params)
  @comment.user_id = current_user.id 
  @comment.commenter = current_user.username
  if @comment.save 
    redirect_to pin_path(@pin), notice: "Successfully created a Comment" 
  else 
    render :new
  end 
end

 def destroy
  @pin = Pin.find(params[:pin_id])
  @comment = @pin.comments.find(params[:id])
  @comment.destroy 
  redirect_to pin_path(@pin)
 end 

  private
   

 def comment_params
   params.require(:comment).permit(:commenter, :content)
    end
end
   