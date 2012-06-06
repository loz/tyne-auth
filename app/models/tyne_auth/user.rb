module TyneAuth
  class User < ActiveRecord::Base
    attr_accessible :email, :firstname, :lastname, :password
  end
end
