class ActivityController < ApplicationController
  before_action :authenticate_user!
  def logs
  end
  def foryou
    @user = current_user.following.find_by(params[:id])
    @blog = @user.blogs.all
  end
  def discover
    @user = User.all
  end
end
