 require 'sidekiq/web'

Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, :controllers =>{
    :registrations =>'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope:user do
    get 'users/sign_out', to: 'users/sessions#destroy'
  end

  mount Sidekiq::Web, at: '/sidekiq'

  resources :to_do_items
  resources :categories
  get 'home/index', to: 'home#index'

   root 'home#index'
  resources :users
  get 'user_home', to: 'users#home'
  post 'user_home', to: 'users#home'
  get 'users', to: 'users#index'
  get '/test', to: 'users#test'
  get '/all' , to: 'users#all'

 get '/user/category', to: 'users#category'
  #get 'user/admin', to: 'users#admin'

get 'to_do_item/calendar', to: 'to_do_items#calendar'
post 'to_do_item/calendar', to: 'to_do_items#time_create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# resources :users

end
