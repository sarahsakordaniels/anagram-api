class WordsController < ApplicationController

  def create
    params.require(:words).each do |word|
      anagram = Anagram.find_or_create_by(key: word.downcase.split(//).sort.join)
      anagram.words.create(spelling: word)
    end
    render status: :created
  end

  def destroy
    does_word_exist?
  end

   private

  def word
    Word.find_by(spelling: params[:spelling])
  end

  def does_word_exist?
    if params[:spelling] && word.nil?
      render status: :not_found
    else
      destroy_words
      render status: :no_content
    end
  end

  def destroy_words
    if params[:spelling]
      Word.destroy(word.id)
    else
      Word.destroy_all
    end
  end
 end
