Rails.application.routes.draw do
  namespace :admin do
    resources :exercises do
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
      resources :activations, only: %i[create destroy], module: :workouts
      resources :workout_exercises, only: %i[show new create destroy]
    end
    resources :workout_exercises, only: %i[destroy]
    get "/dashboard", to: "pages#dashboard"
    resources :series
  end

  resources :plans, only: %i[index show]
  resources :activities, only: %i[index show]
  root "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
