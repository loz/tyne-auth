Rails.application.routes.draw do
  mount TyneAuth::Engine => '/tyne-auth'

  root :to => ''
end
