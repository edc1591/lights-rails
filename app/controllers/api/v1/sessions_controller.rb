class Api::V1::SessionsController < Api::V1::ApiController
	skip_before_filter :api_session_token_authenticate!, only: [:create]

	def create
    if params[:username]
      @user = User.where(:username => params[:username]).first
      current_api_session_token.user = @user if _provided_valid_password? || _provided_valid_api_key?

      puts @user.username+" login"
    end

    render :json => {:auth => current_api_session_token, :color_zones => @user.color_zones}
  end

  private

  def _provided_valid_password?
    params[:password] && UserAuthenticationService.authenticate_with_password!(@user, params[:password])
  end

  def _provided_valid_api_key?
    params[:api_key] && UserAuthenticationService.authenticate_with_api_key!(@user, params[:api_key], current_api_session_token.token)
  end

end
