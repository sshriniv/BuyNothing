class PagesController < ApplicationController
  def home
    @current_user_groups = current_user.groups
  end
end
