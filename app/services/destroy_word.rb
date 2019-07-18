class DestroyWord

  def initialize(word)
    @deleted_word = word
  end

  def word
    Word.find_by(term: @deleted_word)
  end

  def destroy_words
    if @deleted_word
      Word.destroy(word.id)
    else
      Word.destroy_all
    end
  end
end
