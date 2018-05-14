Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'questions/show'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'questions/index'
    end
  end

  namespace :api do
    namespace :v1 do
      get 'questions/create'
    end
  end

  post 'user_token' => 'user_token#create'
  namespace :api do
    namespace :v1 do
      get 'users/create'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
