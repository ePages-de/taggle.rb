Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'

  get '/about/:number', to: 'products#show_number', as: 'about_number'

  resources :products
end
