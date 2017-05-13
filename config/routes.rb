Rails.application.routes.draw do
	root 'welcome#desk_board'
  resources :welcome
  devise_for :users
  devise_for :admins
  namespace :admin do
  	resources :users 
  	resources :admins 
  end
  resources :users do
  	collection do
  		get 'user_home'
  	end
  end
end