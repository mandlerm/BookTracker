class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  before_action :authenticate_user!, except: [:new, :create]

end
