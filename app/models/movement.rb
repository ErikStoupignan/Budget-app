class Movement < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :groups

  validates :name, :amount, presence: true
  validates_presence_of :groups
end
