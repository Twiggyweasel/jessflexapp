Rails.application.routes.draw do
  namespace :admin do
    get 'machines/index'
    get 'machines/show'
    get 'machines/new'
    get 'machines/edit'
  end
  namespace :admin do
    
  end
  namespace :admin do
    resources :activities do 
      resources :variations, except: :index
    end
    resources :machines
    resources :plans
    resources :users
    resources :workouts

    get '/dashboard', to: "pages#dashboard"
  end
  
  resources :plans, only: %i[index show]
  root "plans#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
