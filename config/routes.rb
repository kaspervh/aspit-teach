Rails.application.routes.draw do
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  resources :module_evaluations
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  resources :comments
  
  get 'unread_diary_entries/index'

  #mount Ckeditor::Engine => '/ckeditor'
  resources :instructions
  resources :subjects
  

  resources :users do 
    resources :messages
    resources :diary_entries
    resources :student_goals
  end 

  resources :student_goals, only: [] do 
    resources :student_goal_evaluations
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
