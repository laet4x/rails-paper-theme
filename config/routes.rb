Rails.application.routes.draw do
  get 'home/index', as: "index"
  get 'home/icon', as: "icon"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :articles
 
  root 'home#index'
end
