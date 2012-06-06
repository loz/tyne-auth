module TyneAuth
  class Engine < ::Rails::Engine
    isolate_namespace TyneAuth

    config.generators do |g|
      g.test_framework :rspec
      g.integration_tool :rspec
    end
  end
end
