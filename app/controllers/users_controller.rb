class UsersController < ApplicationController
  def dashboard
    redirect_to new_user_session_path
  end
end
