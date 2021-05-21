class Api::UsersController < ApplicationController
  # before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    ary = [@user]
    ary.push(@user.posts)
    render json: ary
  end
end