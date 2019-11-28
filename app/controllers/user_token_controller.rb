class UserTokenController < KnockKnock::AuthTokenController
  def auth_params
    params.require(:auth).permit(:email, :password, )
  end
end
