class ApplicationController < ActionController::Base
  def home
    render('public/home.html')
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || attachments_path
  end
end
