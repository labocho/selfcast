class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :reject_overcast
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!

  # For this example, we are simply using token authentication
  # via parameters. However, anyone could use Rails's token
  # authentication features to get the token from a header.
  def authenticate_user_from_token!
    user_token = params[:auth_token].presence
    user = user_token && User.find_by_authentication_token(user_token.to_s)

    if user
      # Notice we are passing store false, so the user is not
      # actually stored in the session and a token is needed
      # for every request. If you want the token to work as a
      # sign in token, you can simply remove store: false.
      sign_in user, store: false
    end
  end

  def reject_overcast
    if request.user_agent =~ /^Overcast\//
      render text: "403 Forbidden", status: 403
    end
  end

  def append_info_to_payload(payload)
    super
    payload[:session_id] = session.id
    payload[:user_id] = current_user.try(:id)
    payload[:remote_ip] = request.remote_ip
    payload[:user_agent] = request.user_agent
  end
end
