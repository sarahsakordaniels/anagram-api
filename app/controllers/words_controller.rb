class WordsController < ApplicationController

  def create
    create_word.new_word
      if status = 200
        render json: {
        message: "Words successfully added to the database."
      }
    end
  end

  # DELETE a word
  def destroy
    destroy_word.destroy_words
    if status = 204
      render json: {
        message: "Word deletion successful."
      }
    end
  end

  def data
    render json: Word.data
  end

  def most_anagrams
    render json: Word.most_anagrams
  end

    private

  def destroy_word
    DestroyWord.new(params[:term])
  end

  def create_word
    CreateWord.new(params[:words])
  end
end
