class Anagram < ApplicationRecord
  validates :key, presence: true, uniqueness: true
  has_many :words
end
