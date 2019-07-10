class AnagramsController < ApplicationController
  #GET anagrams for given word
  def index
    render json: {"Anagrams": anagram_list}
  end

  private
  # allows params of word and the limit on how many are returned
  def anagram_params
    params.permit(:spelling, :limit)
  end
  # finds the word passed in the params
  def find_word
    Word.find_by(spelling: params[:spelling])
  end
  # If word exists, it checks for a limit. If word does not exist, error is returned
  def anagram_list
    if word
      limit?
    else
      ["That word does not exist in our database!"]
    end
  end

  # limits the number of results if the limit param is passed
  def limit?
    if params[:limit]
      anagrams[0,params[:limit].to_i]
    else
      anagrams
    end
  end
  # Finds all words associated with the sorted key, and then removes the
  # word itself because a word is not its own anagram by definition.
  def anagrams
    searched_word = word.anagram
    searched_word.words.pluck(:spelling) - [word.spelling]
  end
end
