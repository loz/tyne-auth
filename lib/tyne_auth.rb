require "tyne_auth/engine"
require "action_controller/base"

module TyneAuth
  module Controller

    extend ActiveSupport::Concern

    included do
      helper_method :current_user
      before_filter :require_login
    end

    private
    def current_user
      User.find(session[:user_id]) if session[:user_id]
    end

    def require_login
      unless current_user
        flash[:warning] = I18n.t("authentication.login_first")

        redirect_to(main_app.login_path)
      end
    end
  end
end

ActionController::Base.send(:include, TyneAuth::Controller)
