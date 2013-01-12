require "action_controller/base"

module TyneAuth
  module Extensions
    # Extends the ActionController::Base
    module ActionController

      extend ActiveSupport::Concern

      included do
        helper_method :current_user, :admin_area?
        before_filter :require_login
      end

      # Returns the current user if user is logged in or nil.
      #
      # @return TyneAuth::User
      def current_user
        TyneAuth::User.find(session[:user_id]) if session[:user_id]
      end

      private
      def require_login
        unless current_user
          flash[:warning] = I18n.t("authentication.login_first")

          redirect_to(main_app.login_path)
        end
      end
    end
  end
end
