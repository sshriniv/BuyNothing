class Group < ActiveRecord::Base

    belongs_to :country
    belongs_to :state
	belongs_to :city
	has_many :users, through: :memberships
	has_many :memberships
	has_many :posts
	has_many :pictures, :as => :imageable, dependent: :destroy


	def add_member(user)
		memberships.create(user_id: user.id)
	end

    def remove_member(user)
	end

end
