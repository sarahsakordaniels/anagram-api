class FindAnagrams
  def initialize(term, limit)
    @term = term
    @limit = limit
  end

  def word
    Word.find_by(term: @term)
  end

  def limit_anagrams?
    if @limit
      all_anagrams[0, @limit.to_i]
    else
      all_anagrams
    end
  end

  def anagram_list
    if word
      limit_anagrams?
    else
      ['That word does not exist in our database!']
    end
  end

  # Returns all anagrams, minus the actual word queried since it is not an anagram of itself
  def all_anagrams
    anagram_array = word.anagram.words.pluck(:term) - [word.term]
    if anagram_array == []
      ['This word does not have any anagrams!']
    else
      anagram_array
    end
  end
end
