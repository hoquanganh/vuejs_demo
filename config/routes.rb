Rails.application.routes.draw do
  # root to: 'landing#index'
  resources :posts

  get 'landing/index'
  get 'posts/index'
  
  root 'teams#new'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/teams' => 'teams#index'
      post '/teams' => 'teams#create'

      resources :todos
    end
  end
end
