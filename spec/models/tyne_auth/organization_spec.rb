require 'spec_helper'

describe TyneAuth::Organization do
  describe :associations do
    it { should have_many :organization_memberships }
    it { should have_many :users }
  end
end
