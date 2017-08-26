# == Route Map
#
#                           Prefix Verb     URI Pattern                              Controller#Action
#                         category GET      /category/:id(.:format)                  toppages#index
#                 new_user_session GET      /users/sign_in(.:format)                 devise/sessions#new
#                     user_session POST     /users/sign_in(.:format)                 devise/sessions#create
#             destroy_user_session DELETE   /users/sign_out(.:format)                devise/sessions#destroy
# user_facebook_omniauth_authorize GET|POST /users/auth/facebook(.:format)           users/omniauth_callbacks#passthru
#  user_facebook_omniauth_callback GET|POST /users/auth/facebook/callback(.:format)  users/omniauth_callbacks#facebook
#  user_twitter_omniauth_authorize GET|POST /users/auth/twitter(.:format)            users/omniauth_callbacks#passthru
#   user_twitter_omniauth_callback GET|POST /users/auth/twitter/callback(.:format)   users/omniauth_callbacks#twitter
#                new_user_password GET      /users/password/new(.:format)            devise/passwords#new
#               edit_user_password GET      /users/password/edit(.:format)           devise/passwords#edit
#                    user_password PATCH    /users/password(.:format)                devise/passwords#update
#                                  PUT      /users/password(.:format)                devise/passwords#update
#                                  POST     /users/password(.:format)                devise/passwords#create
#         cancel_user_registration GET      /users/cancel(.:format)                  users/registrations#cancel
#            new_user_registration GET      /users/sign_up(.:format)                 users/registrations#new
#           edit_user_registration GET      /users/edit(.:format)                    users/registrations#edit
#                user_registration PATCH    /users(.:format)                         users/registrations#update
#                                  PUT      /users(.:format)                         users/registrations#update
#                                  DELETE   /users(.:format)                         users/registrations#destroy
#                                  POST     /users(.:format)                         users/registrations#create
#                             root GET      /                                        toppages#index
#                             user GET      /users/:id(.:format)                     users#show
#                 reservation_tour GET      /tours/:id/reservation(.:format)         reservation#index
#         reservation_confirm_tour GET      /tours/:id/reservation/confirm(.:format) redirect(301, /reservation)
#          reservation_thanks_tour GET      /tours/:id/reservation/thanks(.:format)  redirect(301, /reservation)
#                                  POST     /tours/:id/reservation/confirm(.:format) reservation#confirm
#                                  POST     /tours/:id/reservation/thanks(.:format)  reservation#thanks
#                            tours GET      /tours(.:format)                         tours#index
#                                  POST     /tours(.:format)                         tours#create
#                         new_tour GET      /tours/new(.:format)                     tours#new
#                        edit_tour GET      /tours/:id/edit(.:format)                tours#edit
#                             tour GET      /tours/:id(.:format)                     tours#show
#                                  PATCH    /tours/:id(.:format)                     tours#update
#                                  PUT      /tours/:id(.:format)                     tours#update
#                                  DELETE   /tours/:id(.:format)                     tours#destroy
# 

Rails.application.routes.draw do
  
  get "category/:id" => "toppages#index", as: "category"

  devise_for :users, :controllers => {
  :omniauth_callbacks => "users/omniauth_callbacks",
  registration: 'registration',
  :registrations => "users/registrations"
}


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  resources :users, only: [:show]
  resources :tours do
    member do
      ##### 問い合わせフォーム
      get 'reservation' => 'reservation#index' 
      get 'reservation/confirm' => redirect("/reservation")
      #get 'reservation/thanks'=> redirect("/reservation")
      ##### 問い合わせ確認画面
      post 'reservation/confirm' => 'reservation#confirm'
      ##### 問い合わせ完了画面
      post 'reservation/thanks' => 'reservation#thanks'
    end
  end
end
