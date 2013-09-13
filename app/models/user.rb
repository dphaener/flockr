class User < ActiveRecord::Base
  has_many :photos, dependent: :destroy
  
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :username
  validates_uniqueness_of :username
  
end
