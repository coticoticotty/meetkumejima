class ToppagesController < ApplicationController
  def index
     @tours = Tour.order("created_at DESC").page(params[:page])
     @tours = @tours.where("category = ?", params[:id]) if params[:id].present?
  end
end
