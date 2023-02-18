Rails.application.routes.draw do
  devise_for :users
  # resources :users
    resources :foods, except: [:edit, :update]
    resources :recipes, only: [:index, :show, :new, :create, :destroy] do
      resources :recipe_foods, only: [:new, :create, :destroy]
    end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/general_shopping_lists', to: 'general_shopping_lists#general'
  get '/public_recipes', to: 'public_recipes#public'
  # Defines the root path route ("/")
  root "foods#index"
end
