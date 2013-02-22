require "twitter-bootstrap-rails"
require "tyne_auth/engine"
require "tyne_auth/extensions"

# Contains authentication logic
module TyneAuth
  autoload :AuthProcess, 'tyne_auth/auth_processor'
end
