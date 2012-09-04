module TyneAuth
  class User < ActiveRecord::Base
    validates :name, :uid, :token, :presence => true
    attr_accessible :name, :uid, :email, :token

    def self.find_or_create(auth_hash)
      unless user = find_by_uid(auth_hash["uid"])
        user = create!(:uid => auth_hash["uid"], :name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"], :token => auth_hash["credentials"]["token"])
      end

      user
    end
  end
end
