class UsersController < ApplicationController
  def index
  end

  def show
  	 @user = User.find_by_id(params[:id])
  	 @groups = @user.groups
  end
end
