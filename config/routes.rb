Rails.application.routes.draw do
  
  resources :products
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "pages#home"
  get "/restricted", to: "pages#restricted", as: "restricted"
  post "/home", to: "pages#home", as:"home"
  get "/home", to: "pages#home"
  get "/home", to: "pages#home"
  get "/buyer/product/:id", to: "pages#show", as:"see_product"
end
