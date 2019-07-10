class WordsController < ApplicationController

   def create
     params.require(:words).each do |word|
       anagram = Anagram.find_or_create_by(key: word.downcase.chars.sort.join)
       anagram.words.create(spelling: word)
     end
     render status: 201
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
       404
     else
       destroy_words
       204
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
