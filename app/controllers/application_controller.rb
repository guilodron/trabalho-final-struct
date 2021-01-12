class ApplicationController < ActionController::Base
  def homepage
    @todos = User.all
  end
end
