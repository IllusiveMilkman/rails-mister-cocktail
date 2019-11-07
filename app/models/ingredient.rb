class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktails, through: :doses # Is this even necessary?

  validates :name, presence: true, uniqueness: true
end
