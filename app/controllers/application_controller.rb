class ApplicationController < ActionController::Base
    before_action :set_search

    def set_search
        @q = Blog.ransack(params[:q])
    end
end
