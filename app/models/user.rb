class User < ActiveRecord::Base
  attr_accessible :group, :department, :email, :name ,:password,:password_confirmation
  validates :name,presence:true ,uniqueness:true
  validates :department,presence:true
  validates :group,presence:true
  VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:true ,format:{with:VALID_EMAIL_REGEX} ,uniqueness:{case_sensitive:false}
  before_save {|user|user.email=email.downcase}
  has_secure_password





  private
  def create_remember_token
    self.remember_token=SecureRandom.urlsafe_base64
  end
end
