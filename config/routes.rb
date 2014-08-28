Probono::Application.routes.draw do

  resources :maintenance_requests
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users

  resources :users
  
  match "contact" => 'welcome#contact', via: :get
  root :to => 'welcome#index'
  resources :cherrystreet, only: [:index]
  match "cherrystreet/floorplans" => 'cherrystreet#floorplans', via: :get
  match "cherrystreet/neighborhood" => 'cherrystreet#neighborhood', via: :get
  match "cherrystreet/pictures" => 'cherrystreet#pictures', via: :get
  
end
