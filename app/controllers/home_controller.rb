class HomeController < ApplicationController
skip_before_action :authenticate_user!

  def index
    if current_user == nil then
      @user = User.new
    else
       @user = current_user
    end
  end
end
