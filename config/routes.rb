Rails.application.routes.draw do
  get    'signup' => 'users#new'
  post   'signup' => 'user#create'
  get    'signin' => 'sessions#new'
  post   'signin' => 'sessions#create'
  delete 'signout' => 'sessions#destroy'
  resources :users

  get    'diarylist' => 'diaries#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
