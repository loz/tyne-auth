require 'spec_helper'

describe TyneAuth::User do
  describe :associations do
    it { should have_many :organization_memberships }
    it { should have_many :organizations }
  end

  describe :validations do
    it { should validate_presence_of :name }
    it { should validate_presence_of :uid }
    it { should validate_presence_of :token }
  end

  describe :security do
    it { should allow_mass_assignment_of :name }
    it { should allow_mass_assignment_of :username }
    it { should allow_mass_assignment_of :uid }
    it { should allow_mass_assignment_of :email }
    it { should allow_mass_assignment_of :token }
  end


  describe :github_client do
    it "should return a new instance of the github client" do
      user = TyneAuth::User.new(:username => "Foo", :token => "Bar")
      user.github_client.should be_an_instance_of Octokit::Client
    end
  end
end
