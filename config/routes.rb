Rails.application.routes.draw do

  devise_for :users, controllers: {registrations:'user/registrations',sessions:'user/sessions'}
 
  resources :carts
  resources :products
  resources :shipping_info
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
  # Page routes
  root to: "pages#index" 
  get "/", to: "pages#index", as:"index"
  get "/listing", to: "pages#listing", as: "listing"
  post "/listing/:id", to: "pages#add_favorite", as:"add_favorite"
  get "/buyer/product/:id", to: "pages#show", as: "see_product"

  # Cart item routes  
  get 'cart_item/show/:id', to:"cart_item#show", as:"cart_item_show"
  put "cart_item/update/:id", to:"cart_item#update", as: "cart_item_update"
  get "cart_item/edit/:id", to:"cart_item#edit", as: "cart_item_edit"
  delete 'cart_item/destroy/:id', to:"cart_item#destroy", as:"cart_item_destroy"
 
  # Payments routes
  post "/payment/webhook", to: "payment#webhook"
  get '/payment/success', to: 'payment#success'
  get '/payment/webhook'

  # Shipping_info routes
  post "shipping_info/new", to:"shipping_info#create", as: "create_shipping_info"
  put "shipping_info/:id", to:"shipping_info#update", as: "update_info"
  
  # Favorite routes
  get "favorite", to:"favorite#index", as: "favorite_index"
  delete "favorite/destroy/:id", to:"favorite#destroy", as: "favorite_destroy"
 
  # Message routes
  get "/message/:id", to: "message#show", as: "message"
  post "/message", to: "message#send_message", as: "message_post"

  # Product routes
  get "/dashboard/message/:p/:u", to: "products#show_message", as: "get_message"
  post "/dashboard/send-message", to: "products#send_message", as: "send_message_post"
  get "/dashboard", to: "products#dashboard", as: "dashboard"

end


