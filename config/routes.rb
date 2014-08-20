Probono::Application.routes.draw do

  resources :cherrystreet, only: [:index]
  root :to => 'welcome#index'
  
end
