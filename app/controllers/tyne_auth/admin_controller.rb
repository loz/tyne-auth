# Application controller for admin area
class TyneAuth::AdminController < TyneAuth::ApplicationController
  def admin_area?
    true
  end
  helper_method :admin_area?
end
