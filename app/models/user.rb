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
	
	validates :username,:presence => true,:uniqueness => {
    :case_sensitive => false
  }
  
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  
  validate :validate_username

  def fullname
  	"#{fname} #{lname}"
  end
  
  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end
  
  #overriding the find_first_by_auth_conditions method to allow login using username/email
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end
  
  
  
  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  
end
