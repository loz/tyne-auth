module TyneAuth
  # Represents an user
  class User < ActiveRecord::Base
    validates :name, :uid, :token, :presence => true
    attr_accessible :name, :username, :uid, :email, :token

    # Creates or finds a user based on the given user id.
    #
    # @param Hash
    # @return TyneAuth::User
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

    # Returns a Github API wrapper.
    #
    # @return Octokit::Client
    def github_client
      Octokit::Client.new(:login => username, :oauth_token => token)
    end
  end
end
