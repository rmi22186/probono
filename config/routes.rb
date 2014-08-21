Probono::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users

  resources :users

  resources :cherrystreet, only: [:index]
  match "contact" => 'welcome#contact', via: :get
  root :to => 'welcome#index'
  
end
