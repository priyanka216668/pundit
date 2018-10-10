class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  after_action :verify_authorized, unless: :devise_controller?

  #rescue_from Pundit::NotPerformedError, with: :user_not_authorized
 
  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to root_path
  end

  rescue_from NoMethodError do 
     flash[:alert] = "Sorry, something went wrong. Please contact Brandscope customer service."
     redirect_to root_path
   end
end
