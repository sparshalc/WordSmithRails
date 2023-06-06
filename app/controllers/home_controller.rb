class HomeController < ApplicationController
  def index
    @blog = Blog.all.order('Views DESC')
    @blogs = Blog.all.order('Created_at DESC')
    @user = User.all
    end
end
