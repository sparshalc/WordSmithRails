class CommentsController < ApplicationController 
    def create
        @blog = Blog.find_by(id: params[:blog_id])
        @comment = @blog.comments.create(comments_params)
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to blog_path(@blog.id),notice: ' Comment Added'
        else
            redirect_to blog_path(@blog.id),alert: "Comment can't be blank!"
        end
    end

    def destroy
        @blog = Blog.find_by(id: params[:blog_id])
        @comment = @blog.comments.find_by(id: params[:id])
        if @comment.destroy
            redirect_to blog_path(@blog.id),alert: 'Comment Deleted!'
        end
    end

    private
    def comments_params
        params.require(:comment).permit(:title)
    end
end