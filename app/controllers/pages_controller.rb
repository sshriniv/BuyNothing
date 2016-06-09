class PagesController < ApplicationController
  def home
    if current_user
      @current_user_groups = current_user.groups
      
      @current_user_groups_posts = 0
      @current_user_groups.each do |current_user_group|
        @current_user_groups_posts = @current_user_groups_posts+current_user_group.posts.count
      end
    end
  end
end
