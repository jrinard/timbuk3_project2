class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  # The line helper_method :current_user makes current_user method available in the views. By default, all methods defined in Application Controller are already available in the controllers.


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  # The current_user method determines whether a user is logged in or logged out. It does this by checking whether there's a user in the database with a given session id. If there is, this means the user is logged in and @current_user will store that user; otherwise the user is logged out and @current_user will be nil.


  def require_user
    redirect_to '/login' unless current_user
  end

end
