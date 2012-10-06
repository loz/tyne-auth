module TyneAuth
  module Extensions
    autoload :ActionController, "tyne_auth/extensions/action_controller"
  end
end

ActionController::Base.send(:include, TyneAuth::Extensions::ActionController)
