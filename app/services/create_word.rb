class CreateWord

  def initialize(words)
    @words = words
  end

  def new_word
      @words.each do |word|
      anagram = Anagram.find_or_create_by(key: word.downcase.split(//).sort.join)
      anagram.words.create(term: word)
    end
  end
end
