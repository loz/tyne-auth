module TyneAuth
  class User < ActiveRecord::Base
    validates :name, :uid, :token, :presence => true
    attr_accessible :name, :uid, :email, :token

    def self.find_or_create(auth_hash)
      unless user = find_by_uid(auth_hash["uid"])
        user = create! do |user|
          user.uid = auth_hash["uid"]
          user.name = auth_hash["info"]["name"]
          user.username = auth_hash["info"]["nickname"]
          user.email = auth_hash["info"]["email"]
          user.token = auth_hash["credentials"]["token"]
        end
      end

      user
    end

    def github_client
      Octokit::Client.new(:login => username, :oauth_token => token)
    end
  end
end
