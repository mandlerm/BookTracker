class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  before_action :authenticate_user!, except: [:new, :create]

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || :user_root
  end

end
