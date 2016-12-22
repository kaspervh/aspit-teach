Rails.application.routes.draw do
  resources :comments
  resources :messages
  resources :diary_entries 
  get 'unread_diary_entries/index'

  #mount Ckeditor::Engine => '/ckeditor'
  resources :instructions
  resources :subjects
  

  resources :users do 
    resources :messages
    resources :diary_entries
  end 

  
  resources :grades do 
    resources :scheduels
  end

  resources :schools
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "current_user/index"
  get 'how_to/index'
  root "home#index"
end
