class WordsController < ApplicationController

#POST a new word to the db
  def create
    params.require(:words).each do |word|
      anagram = Anagram.find_or_create_by(key: word.downcase.split(//).sort.join)
      anagram.words.create(spelling: word)
    end
    render status: :created
  end

  #DELETE a word
  def destroy
    does_word_exist?
  end

  #GET data on words
  def data
    render json: Word.data
  end

  def most_anagrams
    render json: Word.most_anagrams
  end

   private

#find word in the db
  def word
    Word.find_by(spelling: params[:spelling])
  end

#if queried word does not exist, render 404
  def does_word_exist?
    if params[:spelling] && word.nil?
      render status: :not_found
    else
      destroy_words
      render status: :no_content
    end
  end

#if param passed for word, delete that word
#if no word passed, delete all words in db
  def destroy_words
    if params[:spelling]
      Word.destroy(word.id)
    else
      Word.destroy_all
    end
  end
 end
