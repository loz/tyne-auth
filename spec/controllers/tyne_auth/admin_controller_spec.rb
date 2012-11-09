require 'spec_helper'

describe TyneAuth::AdminController do
  its(:admin_area?) { should be_true }
end
