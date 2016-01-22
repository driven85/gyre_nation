module SessionsHelper

  def sign_in( user )
    cookies.permanent[:sess_token] = user.sess_token
    self.current_user = user
  end

  def current_user=( user )
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_sess_token( cookies[:sess_token] )
    @current_user
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    self.current_user = nil
    cookies.delete( :sess_token )
  end

end

