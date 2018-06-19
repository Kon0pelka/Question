Rails.application.routes.draw do
  root                          'api/v1/questions#index'
  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      root                          'questions#index'
      post 'user_token' => 'user_token#create'
      resources :questions, only: [:index, :show, :create]  do
        resources :answers, only: [:index, :show, :create, :update]
        resources :categories, only: [:index]
        get 'best_answer' => 'questions#best_answer'
      end
      resources :users, only: :create
      resources :categories
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
