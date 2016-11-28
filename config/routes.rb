Rails.application.routes.draw do
  get 'how_to/index'

  mount Ckeditor::Engine => '/ckeditor'
  resources :instructions
  resources :subjects
  resources :users
  resources :grades
  resources :schools
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "current_user/index"
  root "home#index"
end
