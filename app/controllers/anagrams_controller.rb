class AnagramsController < ApplicationController
  #GET anagrams for given word
  def show
    render json: {"anagrams": anagram_list}
  end

  private
  def anagram_params
    params.permit(:spelling, :limit)
  end

  def find_word
    word = Word.find_by(spelling: params[:spelling])
  end

  def limit_anagrams?
    if params[:limit]
      all_anagrams[0,params[:limit].to_i]
    else
      all_anagrams
    end
  end

  def anagram_list
    if word
      limit_anagrams?
    else
      ["That word does not exist in our database!"]
    end
  end

  def all_anagrams
    word.anagram.words.pluck(:spelling) - [word.spelling]
  end
end
