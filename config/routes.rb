Rails.application.routes.draw do
  root "dashboard#index"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :categories
  resources :products
  resources :ingredients
  resources :customers
  resources :orders do
    member do
      patch :update_status
    end
  end
end
