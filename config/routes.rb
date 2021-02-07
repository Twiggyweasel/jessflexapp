Rails.application.routes.draw do
  namespace :admin do
    resources :activities
    resources :plans
  end
  resources :activity_variations
  resources :machines
  resources :users
  resources :plans, only: %i[index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
