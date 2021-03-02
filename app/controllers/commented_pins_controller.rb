class CommentedPinsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @commented_pins = @user.commented_pins
    render :index 
  end

    def my_pinboard 
    @pins = current_user.pins
    render :my_pinboard
  end 

    def my_comments 
    @commented_pins = current_user.pins
    render :my_comments
  end 


end
