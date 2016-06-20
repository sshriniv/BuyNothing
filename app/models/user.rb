class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :groups, through: :memberships
  has_many :memberships
  has_many :posts
  has_many :comments
  has_many :wins
  has_attached_file :avatar
  
	validates_attachment_content_type :avatar,styles: { medium: "300x300>", thumb: "100x100>" },
	content_type:  /^image\/(png|gif|jpeg)/,
	message: "Only images allowed"

  def fullname
  	"#{fname} #{lname}"
  end
end
