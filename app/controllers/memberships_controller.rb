class MembershipsController < ApplicationController
	
	def index
		@current_user_groups = current_user.groups
    end

	def create
		logged_in_user = current_user
		current_group = Group.find(params[:group_id])

		current_group.add_member(logged_in_user)
		flash[:success] = "Membership created successfully"
		redirect_to current_group
	end
end