class SearchsController < ApplicationController
    def search
      @content = params["content"]
      @users = User.where('name LIKE ?', '%'+@content+'%')
      @posts = Post.where('body LIKE ?', '%'+@content+'%')
      @tags = Tag.where('name LIKE ?', '%'+@content+'%')
    end
  
    private
    def search_for(model, content, method)
      if model == 'user'
        if method == 'perfect'
          User.where(name: content)
        else
          User.where('name LIKE ?', '%'+content+'%')
        end
      elsif model == 'post'
        if method == 'perfect'
          Post.where(body: content)
        else
          Post.where('body LIKE ?', '%'+content+'%')
        end
      elsif model == 'tag'
        if method == 'perfect'
          Post.where(name: content)
        else
          Post.where('name LIKE ?', '%'+content+'%')
        end
      end
    end
end