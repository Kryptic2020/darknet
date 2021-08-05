Rails.application.routes.draw do
  get 'message/get'
  get 'message/send'
  get 'message/delete'
  get 'message/update'
  get 'favorite/index'
  get 'favorite/update'
devise_for :users, controllers: {registrations:'user/registrations',sessions:'user/sessions'}
 
  resources :carts
  resources :products
  resources :shipping_info
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "pages#index"
  #get "/restricted", to: "pages#restricted", as: "restricted"
  #post "/home", to: "pages#home", as:"home"
  get "/", to: "pages#index", as:"index"
  get "/test", to: "pages#test", as:"email_now"
  get "/listing", to: "pages#listing", as: "listing"
  post "/listing/:id", to: "pages#add_favorite", as:"add_favorite"
  get "/buyer/product/:id", to: "pages#show", as: "see_product"
  get 'cart_item/index', to:"cart_item#index", as:"cart_item_index"
  get 'cart_item/create', to:"cart_item#create", as: "cart_item_create"
  get 'cart_item/show/:id', to:"cart_item#show", as:"cart_item_show"
  post "cart_item/update/:id", to:"cart_item#update", as: "cart_item_update"
  get "cart_item/edit/:id", to:"cart_item#edit", as: "cart_item_edit"
  delete 'cart_item/destroy/:id', to:"cart_item#destroy", as:"cart_item_destroy"
  post "/payments/webhook", to: "payment#webhook"
  get 'payment/success', to: 'payment#success'
  get 'payment/webhook'
  post "shipping_info/new", to:"shipping_info#create", as: "create_shipping_info"
  put "shipping_info/:id", to:"shipping_info#update", as: "update_info"
  get "test" , to: "payment#test"
  delete "favorite/destroy/:id", to:"favorite#destroy", as: "favorite_destroy"
  get "/message/:id", to: "message#show", as: "message"
  post "/message", to: "message#send_message", as: "message_post"
  get "/dashboard/message/:id", to: "products#show_message", as: "get_message"
  post "/dashboard/send-message", to: "products#send_message", as: "send_message_post"
  get "/dashboard", to: "products#dashboard", as: "dashboard"

end


