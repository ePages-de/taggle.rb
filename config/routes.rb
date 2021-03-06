Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'

  get '/about/:number', to: 'products#show_number', as: 'about_number'
  get '/update_tags/:product_id/:tags', to: 'products#update_tags', as: 'update_tags'
  post '/add_tag/:product_id', to: 'products#add_tag', as: 'add_tag'
  resources :products
end
