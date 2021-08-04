Rails.application.routes.draw do
  get 'favorite/index'
  get 'favorite/update'
devise_for :users, controllers: {registrations:'user/registrations',sessions:'user/sessions'}
 
  resources :carts
  resources :products
  resources :user_contact_info
  
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
  post "user_contact_info/new", to:"user_contact_info#create", as: "create_user_contact_info"
  put "user_contact_info/:id", to:"user_contact_info#update", as: "update_info"
  get "test" , to: "payment#test"
  delete "favorite/destroy/:id", to:"favorite#destroy", as: "favorite_destroy"
end


