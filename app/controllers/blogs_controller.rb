class BlogsController < ApplicationController
    before_action :find_blog,only: [:edit, :update, :destroy, :show]
    before_action :authenticate_user!
    before_action :correct_user, only: [:edit, :update, :destroy]
    def index
        @blog = Blog.all
        @q = Blog.ransack(params[:q])
        @blog = @q.result(distinct: true)
    end
    def new
        @blog = Blog.new
    end
    def create
        @blog = Blog.create(blog_params)
        if @blog.save
            redirect_to root_path, notice: "New blog '#{@blog.title}' Published."
        else
            render :new, status: :unprocessable_entity
        end
    end
    def edit
    end
    def update
        if @blog.update(blog_params)
            redirect_to root_path,notice: " Blog '#{@blog.title}' Updated Successfully."
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def show
        @blog.update(views:@blog.views + 1)
        @comment = @blog.comments.all
    end
    def destroy
        if @blog.destroy
            redirect_to root_path, alert: " Blog '#{@blog.title}' has been Destroyed Successfully ."
        end
    end
    private
    def blog_params
        params.require(:blog).permit(:title,:description, :user_id, :image, :category)
    end
    def find_blog
        @blog = Blog.find_by(id: params[:id])
    end
    def correct_user
        @blog = current_user.blogs.find_by(id: params[:id])
        redirect_to root_path,alert: "Not Authorized!" if @blog.nil?
    end
end
