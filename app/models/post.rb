class Post < ActiveRecord::Base

	#include the ModelHelpers module which is nested in the Helper module - config/Helpers.rb
    include Helpers::ModelHelpers

	belongs_to :group
	belongs_to :user
  
	has_many :comments, :as => :commentable

    has_many :taggings, :as => :taggable
	has_many :tags, :through => :taggings

    has_many :pictures, :as => :imageable, dependent: :destroy
    
    has_one :win
    
    enum status: {active: 0, pending: 1, closed: 2}

	def get_post
     self.is_a?(Post) ? self : self.commentable.get_post
	end

	def self.tagged_with(tag_name)
		Tag.find_by_name!(tag_name).posts
	end

  
  def tag_list
       tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
        Tag.where(name: n.strip).first_or_create!
    end
  end

end
