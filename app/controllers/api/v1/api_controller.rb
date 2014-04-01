class Api::V1::ApiController < ApplicationController
	before_filter :api_session_token_authenticate!

  private
  def signed_in?
    !!current_api_session_token.user
  end

  def current_user
    return current_api_session_token.user unless current_api_session_token.expired?
    _not_authorized "Token Expired"
  end

  def api_session_token_authenticate!
    return _not_authorized unless _authorization_header && current_api_session_token.valid?
  end

  def current_api_session_token
    @current_api_session_token ||= ApiSessionToken.new(_authorization_header)
  end

  def _authorization_header
    params[:auth_token]
  end

  def _not_authorized message = "Not Authorized"
    render json: {error: message}, status: 401
  end

end
