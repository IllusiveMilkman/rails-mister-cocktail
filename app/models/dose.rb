class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: true

  # we now validate the uniqueness pair for :cocktail and ingredient together
  validates :cocktail, uniqueness: { scope: :ingredient }
end
