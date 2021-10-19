class HomesController < ApplicationController
    def top
    end
    def mypage
        @bookmarks = Bookmark.where(user_id: current_user.id)
    end
end
