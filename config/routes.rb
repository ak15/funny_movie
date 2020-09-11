Rails.application.routes.draw do
  root  to: "home#index"
  post '/sessions', to: "session#create"
  get 'share', to: "share#new"
  post 'share', to: "share#create"


  devise_for :user
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
