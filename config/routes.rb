Probono::Application.routes.draw do

  resources :cherrystreet, only: [:index]
  match "contact" => 'welcome#contact', via: :get
  root :to => 'welcome#index'
  
end
