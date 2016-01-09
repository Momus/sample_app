module SessionsHelper

  
  def log_in(user)
  session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
  
  def log_out
    ## TODO: Question  session[:user_id] = nil -- My idea. Seems to work
    session.delete(:user_id)
    @current_user = nil
  end

  
end
