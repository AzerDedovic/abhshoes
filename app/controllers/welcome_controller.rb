class WelcomeController < ApplicationController
  def index
  	@user=current_user
  end

  def logged_in_index
  	@user=current_user
  end
end
