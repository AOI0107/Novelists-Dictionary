class TagsController < ApplicationController
    def show
        @tag = Tag.find(params[:id])
        @posts = params[:id].present? ? @tag.posts : Post.all
    end
end
