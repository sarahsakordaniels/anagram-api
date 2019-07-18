class AnagramsController < ApplicationController

  def show
    anagrams = find_anagrams.anagram_list
    render json: { "anagrams": anagrams }
  end

  private

  def find_anagrams
    FindAnagrams.new(params[:term], params[:limit])
  end
end
