TyneAuth::Engine.routes.draw do
  #devise_for :users, :class_name => "TyneAuth::User"

  resources :welcome, :only => :index

  root :to => 'welcome#index'
end
