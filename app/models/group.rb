class Group < ApplicationRecord
  belongs_to :user
  has_many :group_movements

  validates :name, presence: true
  validates :icon, presence: true
end
