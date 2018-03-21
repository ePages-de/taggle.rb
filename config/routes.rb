Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'about#show'

  get '/about', to: 'about#show', as: 'about'
  get '/about/:number', to: 'about#show_number', as: 'about_number'
end
