Rails.application.routes.draw do
  # root to: 'pages#home'
  # post '/login', to: 'login#login'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, except: [ :destroy, :new, :edit, :create ] do
        member do
          post :update_photo
        end
      end
      post '/login', to: 'users#login'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
