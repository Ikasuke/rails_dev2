Rails.application.routes.draw do
  devise_for :users, :controllers =>{
    :registrations =>'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope:user do
    get 'users/sign_out', to: 'users/sessions#destroy'
  end


  resources :to_do_items
  resources :categories
  get 'home/index', to: 'home#index'
   root 'home#index'
  #resources :users
  get 'users', to: 'users#index'
  get '/test', to: 'users#test'
  get '/all' , to: 'users#all'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# resources :users

end
