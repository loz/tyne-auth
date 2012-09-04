module TyneAuth
  class SessionsController < ApplicationController
    skip_before_filter :require_login, :only => [:new, :create, :failure]

    def create
      auth_hash = request.env['omniauth.auth']

      user = TyneAuth::User.find_or_create(auth_hash)
      session[:user_id] = user.id

      redirect_to main_app.root_path, :notice => I18n.t("authentication.logged_in", :username => user.name)
    end

    def destroy
      session[:user_id] = nil
      redirect_to main_app.login_path, :notice => I18n.t("authentication.logged_out")
    end

    def failure
      flash[:error] = I18n.t("authentication.not_allowed")

      redirect_to main_app.login_path
    end
  end
end
