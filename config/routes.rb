Probono::Application.routes.draw do

  devise_for :users

  namespace :admin do
    get '', to: 'dashboard#index', as: '/' 
  end

  resources :cherrystreet, only: [:index]
  match "contact" => 'welcome#contact', via: :get
  root :to => 'welcome#index'
  
end
