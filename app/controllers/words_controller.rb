class WordsController < ApplicationController
  # POST a new word to the db
  def create
    if create_word.new_word
      render status: :created
    else
      render status: :unauthorized
    end
  end

  # DELETE a word
  def destroy
    if destroy_word.destroy_words
      render status: :no_content
    else
      render status: :not_found
    end
  end

  # GET data on words
  def data
    render json: Word.data
  end

  # GET words with most anagrams
  def most_anagrams
    render json: Word.most_anagrams
  end

    private

  def destroy_word
    DestroyWord.new(params[:term])
    end
  end
