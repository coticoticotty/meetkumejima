class ToursController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]  
  
  def index
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = current_user.tours.build(tours_params)
    
    if @tour.save
      flash[:success] = "ツアーを作成しました。"
      redirect_to @tour
    else
      flash.now[:danger] = "ツアーを作成出来ませんでした。"
      render "tours/new"
    end
  end
  
  def show
    @tour = Tour.find(params[:id])
    @user = User.find(@tour.user_id)
  end

  def edit
    @tour = Tour.find(params[:id])
  end

  def update
    @tour = Tour.find(params[:id])
    
    if @tour.update(tours_params)
      flash[:success] = "更新しました"
      redirect_to @tour
    else
      flash.now[:danger] = "更新できませんでした"
      render :edit
    end
  end

  def destroy
    @tour.destroy
    flash[:success] = "ツアーを削除しました。"
    redirect_to user_url(current_user)
  end
  
  private
  
  def tours_params
    params.require(:tour).permit(:title, :content, :duration, :price, :category, :tour_image)
  end
  
  def correct_user
    @tour = current_user.tours.find_by(id: params[:id])
    unless @tour
    redirect_back(fallback_location: root_path)
    flash[:danger] = "作成者しか編集・削除できません。"
    end
  end
end
