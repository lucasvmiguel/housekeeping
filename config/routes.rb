Rails.application.routes.draw do
  resources :bills
  resources :users

  get '/reports', to: 'reports#index'
  post '/reports', to: 'reports#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
