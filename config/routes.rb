Rails.application.routes.draw do
  root "foods#index"
  resources :recipes, only:[:index, :show, :new, :create, :destroy, :update] do 
    resources :recipe_foods, only: [:new,:create,:destroy, :edit, :update]
  end
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :foods

  # Defines the root path route ("/")
  
  # define route for public_recipes
  get "/public_recipes", to: "recipes#public", as: "public_recipes"
  
  # define route for shooping_list
  get "/shooping_list", to: "foods#shooping_list", as: "shooping_list"
end
