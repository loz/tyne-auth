Rails.application.routes.draw do

  mount TyneAuth::Engine => "/tyne_auth"
end
