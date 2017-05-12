Rails.application.routes.draw do
  devise_for :users
  devise_for :admins
  root 'welcome#desk_board'
  resources :welcome
  namespace :admin do
  	resources :users 
  	resources :admins 
  end
end