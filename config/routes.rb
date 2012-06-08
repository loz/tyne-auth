TyneAuth::Engine.routes.draw do
  devise_for :users, {
    :class_name => "TyneAuth::User",
    :module => :devise
  }

  resources :users
  resources :organizations

  root :to => 'users#index'
end
