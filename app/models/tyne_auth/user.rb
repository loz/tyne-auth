require 'tyne_auth/auth_processor'

module TyneAuth
  # Represents an user
  class User < ActiveRecord::Base
    validates :name, :uid, :token, :presence => true
    attr_accessible :name, :username, :uid, :email, :token, :gravatar_id

    has_many :organization_memberships, :class_name => 'TyneAuth::OrganizationMembership'
    has_many :organizations, :through => :organization_memberships, :class_name => 'TyneAuth::Organization'

    # Returns a Github API wrapper.
    #
    # @return Octokit::Client
    def github_client
      Octokit::Client.new(:login => username, :oauth_token => token)
    end
  end
end
