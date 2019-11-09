class Review < ApplicationRecord
  belongs_to :cocktail

  validates :content, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }
end
