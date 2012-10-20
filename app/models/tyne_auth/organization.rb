module TyneAuth
  # Represents an organisation
  class Organization < ActiveRecord::Base
    attr_accessible :name
  end
end
