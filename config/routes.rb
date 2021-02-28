Rails.application.routes.draw do

  namespace :admin do
    resources :activities do 
      resources :variations
      resources :series
    end
    resources :machines
    resources :plans do
      resources :plan_workouts, only: %i[new create]
    end
    resources :plan_workouts, only: %i[destroy]
    resources :users
    resources :workouts do
      resources :workout_activities, only: %i[new create]
    end
    resources :workout_activities, only: %i[destroy]
    get '/dashboard', to: "pages#dashboard"
  end
  
  resources :plans, only: %i[index show]
  root "plans#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
