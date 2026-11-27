
Rails.application.routes.draw do
  resources :categories, only: [:index, :show]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"

  root "products#index"

  resources :products, only: [:index, :show] do
    collection do
      get :search
    end
  end

  resource :cart, only: [:show] do
    post :add
    patch :update_item
    delete :remove
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
