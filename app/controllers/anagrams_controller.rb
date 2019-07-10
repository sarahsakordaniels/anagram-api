class AnagramsController < ApplicationController
  #GET anagrams for given word
  def show
    render json: {"anagrams": anagram_list}
  end

  private
  # allows params of word and the limit on how many are returned
  def anagram_params
    params.permit(:spelling, :limit)
  end

  # finds the word passed in the params
  def find_word
    word = Word.find_by(spelling: params[:spelling])
  end

  #checks for a limit param. If none, run entire list of available anagrams
  def limit_anagrams?
    if params[:limit]
      all_anagrams[0,params[:limit].to_i]
    else
      all_anagrams
    end
  end

#if the word exists, checks for limit param. From there, the limit_anagrams? method will render json. if the word does not exist, error message will appear.
  def anagram_list
    if word
      limit_anagrams?
    else
      ["That word does not exist in our database!"]
    end
  end

  #finds all words associated with the search param via anagram key, then removes the searched word because it is not an anagram of itself
  def all_anagrams
    word.anagram.words.pluck(:spelling) - [word.spelling]
  end
end
