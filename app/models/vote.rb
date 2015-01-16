class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates :vote_value,
            presence: true,
            numericality: true,
            inclusion: { in: [-1,1] }


  def self.sum_values
    self.sum(:vote_value)
  end
end
