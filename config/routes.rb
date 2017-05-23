Rails.application.routes.draw do
	root 'welcome#desk_board'
  
  resources :welcome

  devise_for :users, controllers: { registrations: 'registrations'}


  devise_for :admins, controllers: { registrations: 'registrations' }
  
  namespace :admin do
  	resources :users 
  	resources :admins 
  	resources :leaves 
    resources :leave_types
  end
  
  resources :users
  resources :leaves do
      member do
        get 'approve'
        get 'reject'
      end
    end
end