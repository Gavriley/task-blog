class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # include CanCan::ControllerAdditions
  
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied, with: -> { redirect_to root_url, :notice => "Недостатньо прав для здійснення даної дії" }
  rescue_from ActiveRecord::RecordNotFound, with: -> { render 'not_found/index', layout: 'not_found' } 
  
  protected

	  def configure_permitted_parameters
	    added_attrs = [:login, :email, :name, :password, :password_confirmation, :remember_me]
	    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
	    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
	  end
end
