Rails.application.routes.draw do
  resources :to_do_items
  resources :categories
  get 'home/index'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# resources :users

end
