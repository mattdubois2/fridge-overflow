class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :questions, through: :taggings

  validates :name,
            uniqueness: true,
            presence: true,
            length: {minimum: 2, maximum: 20}
end
