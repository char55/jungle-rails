class User < ActiveRecord::Base
  validates :email, uniqueness: { case_sensitive: false }
  
  has_secure_password

  validates :password, length: { minimum: 6 }
  has_many :reviews
  validates :name, presence: true
  validates :email, presence: true

end
