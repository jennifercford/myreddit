class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    user_id = session[:user_id]
    if user_id
      User.find_by(id: user_id)
    end
  end

  def authenticate!
    unless current_user
      flash[:notice] = "You must be logged in in order to do this."
      redirect_to :root
    end
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    flash[:notice] = "Couldn't find the requested object in the databse.
                           Is your input correct?"
    redirect_to :root
  end

end
