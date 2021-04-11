Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users

  root to: "home#index"

  get "/set_cookie", to: "home#set_cookie"
  get "/show_cookie", to: "home#show_cookie"

  #resources :users do
  #  resources :profile, only: [:index, :edit, :create]
  #end

  # accepts username param after establishing a one-to-one relationship
  resources :profile, param: :user_id, only: [:show]
  get "/myprofile" => "profile#current_user_profile", as: :current_user_profile


  resources :users do
    resources :courses
  end

  resources :communities do
    resources :posts
  end

  get "/search", to: "communities#search"

  # generated CRUD functionality with a scaffold, but I only wanted one profile per user,
  # this relationship is established and I thopught it was clearer navigation to now have the user/profile/course if's within the URL.
  #get "profile/:username/courses" => "courses#index", as: :all_courses
  #get "profile/:username/courses/:id" => "courses#show", as: :course
  #get "profile/:username/courses/new" => "courses#new", as: :new_course

  get "/topicsOfInspiration" => "inspiration#news_topics", as: :top_news_stories
  get '/topicsOfInspiration/:id', to: 'inspiration#news_topics_comments', as: :story_comments

  # uses our 'newscatcher' api
  get '/customizedTopicsOfInspiration/:custom_topic', to: 'inspiration#custom_latest_articles', as: :custom_latest_articles
  # uses our 'newsapi' api
  get '/customTopicOfInspiration/:custom_topic', to: 'inspiration#custom_latest_headlines', as: :custom_latest_headlines


end
