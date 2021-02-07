Rails.application.routes.draw do
  namespace :admin do
    resources :activities do 
      resources :variations, except: :index
    end
    resources :plans
  end
  resources :machines
  resources :users
  resources :plans, only: %i[index show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
