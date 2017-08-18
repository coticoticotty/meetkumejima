class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  #コントローラーがdeviseのものならばproetctedにあるストロングパラメータ設定を実行
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permitted_parameters
    #create用 ストロングパラメータ
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :introduction, :affiliation, :address])
    #edit用ストロングパラメータ
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction, :affiliation, :address])
  end
end