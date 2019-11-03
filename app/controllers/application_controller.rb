class ApplicationController < ActionController::Base
  def home
    render('public/home.html')
  end
end
