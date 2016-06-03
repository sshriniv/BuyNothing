class Group < ActiveRecord::Base

    belongs_to :country
    belongs_to :state
	belongs_to :city
	has_many :users, through: :memberships
	has_many :memberships
	has_many :posts
	has_attached_file :group_avatar
  
	validates_attachment_content_type :group_avatar,styles: { medium: "300x300>", thumb: "100x100>" },
	content_type:  /^image\/(png|gif|jpeg)/,
	message: "Only images allowed"


	def add_member(user)
		memberships.create(user_id: user.id)
	end

    def remove_member(user)
	end

end
