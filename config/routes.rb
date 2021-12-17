Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :developers,    only: [:create]
      resources :teams,         only: [:create, :update]
      resources :messages,      only: [:create]
    end
  end
end
