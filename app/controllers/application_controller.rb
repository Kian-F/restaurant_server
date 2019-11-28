class ApplicationController < ActionController::Base
  include KnockKnock::Authenticable
  skip_before_action :verify_authenticity_token
end
