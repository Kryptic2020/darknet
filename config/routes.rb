Rails.application.routes.draw do
  get 'user_info/index'
  get 'user_info/show'
  get 'user_info/edit'
  get 'user_info/create'
  get 'user_info/delete'
  get 'payment/checkout'
  get 'payment/webhook'
  resources :carts
  resources :products
  resources :user_info
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "pages#home"
  get "/restricted", to: "pages#restricted", as: "restricted"
  post "/home", to: "pages#home", as:"home"
  get "/home", to: "pages#home"  
  get "/buyer/product/:id", to: "pages#show", as: "see_product"
  get 'cart_item/index', to:"cart_item#index", as:"cart_item_index"
  get 'cart_item/create', to:"cart_item#create", as: "cart_item_create"
  get 'cart_item/show/:id', to:"cart_item#show", as:"cart_item_show"
  post "cart_item/update/:id", to:"cart_item#update", as: "cart_item_update"
  get "cart_item/edit/:id", to:"cart_item#edit", as: "cart_item_edit"
  delete 'cart_item/destroy/:id', to:"cart_item#destroy", as:"cart_item_destroy"
  post "/payment/webhook", to: "payment#webhook"
  get 'payment/success', to: 'payment#success'
  get 'payment/webhook'
  

end


