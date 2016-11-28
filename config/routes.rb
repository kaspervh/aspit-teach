Rails.application.routes.draw do
  resources :users
  resources :grades
  resources :schools
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "current_user/index"
  root "home#index"
end
