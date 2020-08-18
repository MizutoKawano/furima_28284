Rails.application.routes.draw do
  
  devise_for :users
 root 'items#index'
 get 'items', to: 'items#new'
 resources :items, only:[:new, :create, :show]
end