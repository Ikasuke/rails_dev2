Rails.application.routes.draw do
  resources :to_do_items
  resources :categories
  get 'home/index', to: 'home#index'
   root 'home#index'
  resources :users
  get '/test', to: 'users#test'
  get '/all' , to: 'users#all'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# resources :users

end
