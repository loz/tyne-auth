require "tyne_auth/extensions/action_controller"

module TyneAuth
  module Extensions
  end
end

ActionController::Base.send(:include, TyneAuth::Extensions::ActionController)
