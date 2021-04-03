Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users

  # accepts username param after establishing a one-to-one relationship
  resources :profile, param: :username, only: [:show]
  get "myprofile" => "profile#current_user_profile"

  resources :users do
    resources :courses
  end

  resources :communities do
    resources :posts
  end

  root to: "home#index"

end
