class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user

  def current_user 
    ap "Application_controller#current_user"  
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if @current_user
     ap  @current_user_name = @current_user.role.name.downcase.gsub(" ", "_")
    end
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end



  def super_admin?
    return nil unless current_user
    @current_user.super_admin?
  end
  helper_method :super_admin?

  def admin?
    return nil unless current_user
    @current_user.admin?
  end
  helper_method :admin?

  def mentor?
    return nil unless current_user
    current_user.mentor?
  end
  helper_method :mentor?

  def teacher?
    return nil unless current_user
    current_user.teacher?
  end
  helper_method :teacher?

  def student? 
    return nil unless current_user
    current_user.student?      
  end
  helper_method :student?
  


end
