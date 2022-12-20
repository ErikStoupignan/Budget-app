class Movement < ApplicationRecord
  belongs_to :user
  has_many :group_movements

  validates :name, presence: true, allow_blank: false
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
