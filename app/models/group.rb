class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :movements

  validates :name, presence: true, allow_blank: false, uniqueness: { scope: :user }
  validates :icon, presence: true, allow_blank: false
end
