#way for users to sign in

class UserTokenController < Knock::AuthTokenController
  skip_before_action :verify_authenticity_token # this is required API's
end
