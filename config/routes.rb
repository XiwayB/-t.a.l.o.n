Rails.application.routes.draw do
  # root to: 'pages#home'
  # post '/login', to: 'login#login'
  # get 'users/new', to: 'users#new', as: "new_user"
  resources :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, except: [ :destroy, :new, :edit, :create ]
      post '/login', to: 'users#login'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
