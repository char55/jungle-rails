class User < ActiveRecord::Base
  validates :email, uniqueness: { case_sensitive: false }
  before_create :downcase_email
  
  has_secure_password

  validates :password, length: { minimum: 5 }
  has_many :reviews
  validates :name, presence: true
  validates :email, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)  
    if user && user.authenticate(password)
      return user
    end
    return nil
  end

  private
    def downcase_email
      self.email.downcase!
    end

end
