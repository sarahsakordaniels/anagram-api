class Word < ApplicationRecord
  validates :spelling, uniqueness: true
  belongs_to :anagram


  def self.data
    {
      "total words": total_words,
      "shortest word length": min_word_length,
      "longest word length": max_word_length,
      "median word length": median_word_length,
      "average word length": average_word_length
    }
  end

private
  @words = Word.all.map(&:spelling)
  def self.word_lengths
    @words.map do |word|
      word.length
    end
  end

  def self.total_words
   @words.length
  end

  def self.min_word_length
    @words.sort.first.length
  end

  def self.max_word_length
   @words.reverse.first.length
  end

  def self.median_word_length
    middle = ((word_lengths.length - 1) / 2.0)
    ((word_lengths[middle.floor] + word_lengths[middle.ceil]) / 2.0)
  end

  def self.average_word_length
    word_lengths.sum / word_lengths.length
  end

end
