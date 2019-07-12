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

  def self.most_anagrams
    {
      "words with the most anagrams": @words_with_most_anagrams
    }
  end

private

  #find most occurances of a given anagram_id
  @anagram_id = Word.all.map(&:anagram_id).mode
  @words_with_most_anagrams = Word.all.where(anagram_id: @anagram_id).pluck(:spelling)
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
