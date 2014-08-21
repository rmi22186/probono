Probono::Application.routes.draw do

  match "contact" => 'welcome#contact', via: :get
  root :to => 'welcome#index'
 
  resources :cherrystreet, only: [:index]
  match "cherrystreet/floorplan" => 'cherrystreet#floorplan', via: :get
  
end
