class ToppagesController < ApplicationController
  def index
    @tours = Tour.order("created_at DESC").page(params[:page])
  end
end
