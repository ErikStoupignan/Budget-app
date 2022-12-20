class Group < ApplicationRecord
  belongs_to :user
  has_many :group_movements

  validates :name, presence: true, allow_blank: false
  validates :icon, presence: true, allow_blank: false
end
