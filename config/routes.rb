Probono::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users

  resources :users
  
  match "contact" => 'welcome#contact', via: :get
  root :to => 'welcome#index'
  resources :cherrystreet, only: [:index]
  match "cherrystreet/floorplan" => 'cherrystreet#floorplan', via: :get
  
end
