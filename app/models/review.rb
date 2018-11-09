class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :product, presence: true
  validates :user, presence: true
  validates :description, presence: true
  validates :rating, presence: true
end


# Is a review without a product (parent) valid?
# Is a review without a user (reviewer) valid?
# Is a review with no description valid?
# Is a review with no rating valid?