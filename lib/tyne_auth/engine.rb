require "omniauth"
require "omniauth-github"
require "octokit"

module TyneAuth
  class Engine < ::Rails::Engine
    isolate_namespace TyneAuth

    config.generators do |g|
      g.test_framework :rspec
      g.integration_tool :rspec
    end

    initializer "tyne_auth.omniauth" do |app|
      app.middleware.use(OmniAuth::Builder) do
        provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
      end
    end
  end
end
