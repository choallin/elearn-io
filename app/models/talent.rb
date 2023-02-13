class Talent < ApplicationRecord
  has_and_belongs_to_many :courses

  validates :firstname, presence: true
  validates :lastname, presence: true
end
