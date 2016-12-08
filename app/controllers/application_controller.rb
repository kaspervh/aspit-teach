class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user

  def current_user 
    ap "Application_controller#current_user"
    if user_id = session[:user_id]
      ap user_id
    @current_user ||= User.joins(:role).find(user_id)

    else 
    @current_user ||=  User.first
    end
    @current_user_name = @current_user.role.name.downcase.gsub(" ", "_")
  end
  helper_method :current_user


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
