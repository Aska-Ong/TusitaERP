class User < ActiveRecord::Base
  has_many :topics, :dependent => :destroy
  has_many :posts, :dependent => :destroy
  has_many :userroles, :dependent => :destroy
  has_many :roles, :through => :userroles
	before_save { self.username = username.downcase }
	before_create :create_remember_token
	validates :username,  presence: true, length: { maximum: 20 }, uniqueness: {case_sensitive: false}
	has_secure_password
  validates :password, length: { minimum: 6 }

  attr_accessible :username,:password,:password_confirmation,:roles
   
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
