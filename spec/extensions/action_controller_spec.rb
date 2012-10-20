require 'spec_helper'

# Test controller to test integration
class TestController < ActionController::Base
  def index
    render :text => "Foo"
  end
end

describe TyneAuth::Extensions::ActionController, :type => :controller do
  before :all do
    Rails.application.routes.draw do
      controller :test do
        get 'test/index' => :index
      end
    end

    @controller = TestController.new
  end

  context :logged_in do
    before :each do
      subject.stub(:current_user).and_return(:foo)
    end

    it "should not deny access" do
      get :index
      response.should be_success
    end
  end

  context :logged_out do
    it "should deny access" do
      get :index
      response.should redirect_to login_path
    end
  end

  after :all do
    Rails.application.reload_routes!
  end
end
