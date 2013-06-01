Tutorgrapeapi::Application.routes.draw do
  get 'login' => 'user_sessions#new', :as => 'login'

  post 'create_session' => 'user_sessions#create', :as => 'login_user'
  
  get 'logout' => 'user_sessions#destroy', :as => 'logout'

  get 'home' => 'dashboard#home', :as => 'home'

  get 'signup' => 'users#new', :as => 'create_account'
  post 'submit_email' => 'profiles#submit', :as => 'submit'
  
  root :to => 'dashboard#home'
  resources :users
end
