class Step < ApplicationRecord
  belongs_to :recipy

  validates :name, :description, :image, presence: true
  validates :timer, numericality: { greater_than: 0, allow_nil: true }
end
