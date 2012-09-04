module TyneAuth
  class User < ActiveRecord::Base
    attr_accessible :firstname, :lastname
  end
end
