 require 'sidekiq/web'

Rails.application.routes.draw do
  #activeadmin
  ActiveAdmin.routes(self)
  #devise
  devise_for :users, :controllers =>{
    :registrations =>'users/registrations',
    :sessions => 'users/sessions'
  }
  devise_scope:user do
    get 'users/sign_out', to: 'users/sessions#destroy'
  end

#sidekiq
  mount Sidekiq::Web, at: '/sidekiq'

 #home画面
   root 'home#index'
   get 'home/index', to: 'home#index'

#User
  resources :users
  get 'user_home', to: 'users#home'
  post 'user_home', to: 'users#home'
  #get 'users', to: 'users#index'
  #get '/user/category', to: 'users#category'
  #get 'user/admin', to: 'users#admin'

#ToDoItem
  resources :to_do_items
  get 'to_do_item/sort', to: 'to_do_items#sort'

#Category
  resources :categories

###ajaxやろうとしている
post 'categories/simple_create', to: 'categories#simple_create'
post 'categories/simple_destroy', to: 'categories#simple_destroy'

# カレンダー表示
get 'to_do_item/events', to: 'to_do_items#events'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# resources :users

end
