Rails.application.routes.draw do
	root 'welcome#desk_board'
  
  resources :welcome

  devise_for :users, controllers: { registrations: 'registrations'}


  devise_for :admins, controllers: { registrations: 'registrations' }
  
  namespace :admin do
  	resources :users 
  	resources :admins 
  end
  
  resources :users
end