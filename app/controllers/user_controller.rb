class UserController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  def show
    @user = User.find(params[:id])
    @blog = Blog.all
  end

  def follow
    current_user.send_follow_request_to(@user)
    redirect_to user_path, notice: "Follow request send to #{@user.email}."
  end

  def unfollow
    make_it_a_unfriend_request

    current_user.unfollow(@user)
  end

  def accept
    current_user.accept_follow_request_of(@user)
    make_it_a_friend_request
    redirect_to activity_logs_path, notice: "You have started following #{@user.email}."
  end

  def decline
    current_user.decline_follow_request_of(@user)
    redirect_to activity_logs_path, alert: "Follow request of #{@user.email} declined."
  end

  def cancel
    current_user.remove_follow_request_for(@user)
    redirect_to user_path
  end

  private

  def make_it_a_friend_request
    current_user.send_follow_request_to(@user)
    @user.accept_follow_request_of(current_user)
  end

  def make_it_a_unfriend_request
    @user.unfollow(current_user) if @user.mutual_following_with?(current_user)
    redirect_to activity_logs_path, alert: "#{@user.email} removed from your following list"
  end

  def set_user
    @user = User.find(params[:id])
  end
end