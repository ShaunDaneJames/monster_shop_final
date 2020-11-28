Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get :root, to: 'welcome#index'

  # resources :merchants do
  #   resources :items, only: [:index]
  # end
  get '/merchants', to: 'merchants#index', as: :merchants
  post '/merchants', to: 'merchants#create'
  get '/merchants/new', to: 'merchants#new', as: :new_merchant
  get '/merchants/:id/edit', to: 'merchants#edit', as: :edit_merchant
  get '/merchants/:id', to: 'merchants#show', as: :merchant
  patch '/merchants/:id', to: 'merchants#update'
  put '/merchants/:id', to: 'merchants#update'
  delete '/merchants/:id', to: 'merchants#destroy'
  get '/merchants/:merchant_id/items', to: 'items#index', as: :merchant_items

  # resources :items, only: [:index, :show] do
  #   resources :reviews, only: [:new, :create]
  # end
  post 'items/:item_id/reviews', to: 'reviews#create', as: :item_reviews
  get '/items/:item_id/reviews/new', to: 'reviews#new', as: :new_item_review
  get '/items/', to: 'items#index', as: :items
  get '/items/:id', to: 'items#show', as: :item

  # resources :reviews, only: [:edit, :update, :destroy]
  get '/reviews/:id', to: 'reviews#edit', as: :edit_review
  patch '/reviews/:id', to: 'reviews#update'
  delete '/reviews/:id', to: 'reviews#destroy', as: :review

  get '/cart', to: 'cart#show'
  post '/cart/:item_id', to: 'cart#add_item'
  delete '/cart', to: 'cart#empty'
  patch '/cart/:change/:item_id', to: 'cart#update_quantity'
  delete '/cart/:item_id', to: 'cart#remove_item'

  get '/registration', to: 'users#new', as: :registration
  resources :users, only: [:create, :update]
  patch '/user/:id', to: 'users#update'
  get '/profile', to: 'users#show'
  get '/profile/edit', to: 'users#edit'
  get '/profile/edit_password', to: 'users#edit_password'
  post '/orders', to: 'user/orders#create'
  get '/profile/orders', to: 'user/orders#index'
  get '/profile/orders/:id', to: 'user/orders#show'
  delete '/profile/orders/:id', to: 'user/orders#cancel'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout'

  # namespace :merchant do
  #   get '/', to: 'dashboard#index', as: :dashboard
  #   resources :orders, only: :show
  #   resources :items, only: [:index, :new, :create, :edit, :update, :destroy]
  #   put '/items/:id/change_status', to: 'items#change_status'
  #   get '/orders/:id/fulfill/:order_item_id', to: 'orders#fulfill'
  # end
  get '/merchant', to: 'merchant/dashboard#index', as: :merchant_dashboard
  get '/merchant/orders/:id', to: 'merchant/orders#show', as: :merchant_order
  get '/merchant/items', to: 'merchant/items#index'
  post '/merchant/items', to: 'merchant/items#create'
  get '/merchant/items/new', to: 'merchant/items#new', as: :new_merchant_item
  get '/merchant/items/:id/edit', to: 'merchant/items#edit', as: :edit_merchant_item
  patch '/merchant/items/:id', to: 'merchant/items#update', as: :merchant_item
  put '/merchant/items/:id', to: 'merchant/items#update'
  delete '/merchant/items/:id', to: 'merchant/items#destroy'
  put '/merchant/items/:id/change_status', to: 'merchant/items#change_status'
  get '/merchant/orders/:id/fulfill/:order_item_id', to: 'merchant/orders#fulfill'

  # namespace :admin do
  #   get '/', to: 'dashboard#index', as: :dashboard
  #   resources :merchants, only: [:show, :update]
  #   resources :users, only: [:index, :show]
  #   patch '/orders/:id/ship', to: 'orders#ship'
  # end
  get '/admin', to: 'admin/dashboard#index', as: :admin_dashboard
  get '/admin/merchants/:id', to: 'admin/merchants#show', as: :admin_merchant
  patch '/admin/merchants/:id', to: 'admin/merchants#update'
  put '/admin/merchants/:id', to: 'admin/merchants#update'
  get '/admin/users', to: 'admin/users#index', as: :admin_users
  get '/admin/users/:id', to: 'admin/users#show', as: :admin_user
  patch '/admin/orders/:id/ship', to: 'admin/orders#ship', as: :admin

  get '/merchant/:merchant_id/discount/new', to: 'discounts#new', as: :discounts
  post '/merchant/:merchant_id/discount/new', to: 'discounts#create'
  get '/merchant/:merchant_id/:discount_id/edit', to: 'discounts#edit'
  get '/merchant/:merchant_id/:discount_id/destroy', to: 'discounts#destroy'
  patch '/merchant/:merchant_id/:discount_id/update', to: 'discounts#update'
end
