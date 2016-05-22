class Comment < ActiveRecord::Base

	#include the ModelHelpers module which is nested in the Helper module - config/Helpers.rb
    include Helpers::ModelHelpers
	
	has_many :comments, :as => :commentable
	belongs_to :commentable, :polymorphic => true
	
	belongs_to :user

    #def get_post
    #  	self.is_a?(Post) ? self : self.commentable.get_post
	#end
end
