class AnagramsController < ApplicationController

  #GET anagrams and returns list of anagrams of the queried word
  def show
    render json: { "anagrams": anagram_list }
  end

  private

#permits user to pass word spelling and limit parameters
  def anagram_params
    params.permit(:spelling, :limit)
  end

#finds a word in the database by spelling attribute
  def find_word
    word = Word.find_by(spelling: params[:spelling])
  end

#if the user passes a limit parameter, return that number of all applicable anagrams. If not, return all applicable anagrams.
  def limit_anagrams?
    if params[:limit]
      all_anagrams[0, params[:limit].to_i]
    else
      all_anagrams
    end
  end

#If a word is found, check if the user passed a limit. If not, that method will return all anagrams.
#If the word is not found, return error message
  def anagram_list
    if word
      limit_anagrams?
    else
      ['That word does not exist in our database!']
    end
  end

#Returns all anagrams, minus the actual word queried since it is not an anagram of itself
  def all_anagrams
    anagram_array = word.anagram.words.pluck(:spelling) - [word.spelling]
    if anagram_array == []
      ['This word does not have any anagrams!']
    else
      anagram_array
    end
  end
end
