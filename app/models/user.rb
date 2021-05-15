class User < ActiveRecord::Base
  has_secure_password
  has_many :sharks
  validates :username, uniqueness: true
  validates :password, length: { in: 6..60 }


end
