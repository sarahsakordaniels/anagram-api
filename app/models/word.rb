class Word < ApplicationRecord
  validates :spelling, uniqueness: true
  belongs_to :anagram
end
