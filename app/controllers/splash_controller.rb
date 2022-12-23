class SplashController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    @splash_page = true
  end
end
