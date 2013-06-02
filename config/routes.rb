Tutorgrapeapi::Application.routes.draw do
  get 'login' => 'user_sessions#new', :as => 'login'
  get 'finder'=> 'dashboard#finder', :as => 'finder'
  post 'create_session' => 'user_sessions#create', :as => 'login_user'
  
  get 'logout' => 'user_sessions#destroy', :as => 'logout'

  get 'home' => 'dashboard#home', :as => 'home'

  get 'signup' => 'users#new', :as => 'create_account'
  post 'submit_email' => 'profiles#submit', :as => 'submit'

  get 'activate/:activation_key' => 'profiles#activate', :as => "activation"
  
  post 'subjects' => 'profiles#subjects', :as => "subjects"  
  delete 'subjects' => 'profiles#remove_subjects', :as => "remove_subjects"  
  
  root :to => 'dashboard#home'
  resources :users
  resources :profiles
end
