class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tours = @user.tours.order("created_at DESC").page(params[:page])
  end
end