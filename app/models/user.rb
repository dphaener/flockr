class User < ActiveRecord::Base
  before_save do
    self.email = email.downcase
    self.username = username.downcase
  end
  
  has_many :photos, dependent: :destroy
  has_secure_password
  
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => /.+(@).+(.).+/
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_length_of :password, :minimum => 6
  validates_confirmation_of :password
  
end
