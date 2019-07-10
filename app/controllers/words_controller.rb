class WordsController < ApplicationController
  # adds a new word to the database and renders JSON of the added word
   #
   # @return [JSON]
   def create
     params.require(:words).each do |word|
       anagram = Anagram.find_or_create_by(key: word.downcase.chars.sort.join)
       anagram.words.create(spelling: word)
     end
     render status: 201
   end

 #   def create
 #   words = word_maker.new_words
 #   if words.length > 0
 #     words.each do |word|
 #       word.save
 #     end
 #     render json: {message: "Success!"}, status: 201
 #   else
 #     render json: {error: "Try a different word"}, status: 400
 #   end
 # end


   # Removes a word(found by spelling params) from dictionary. It will no longer show up
   # as an anagram for other words. If you try to delete a word that does not exist, a 404 renders.
   # @return [status] shows the user a 204 status to confirm word was deleted.
   def destroy
     render status: status
   end

   private

   # Checks if user is trying to delete a single word or ALL words, then destroys
   def delete_words
     if params[:spelling]
       Word.destroy(word.id)
     else
       Word.delete_all
     end
   end

   # Finds the word object associated with the spelling passed in params
   def word
     Word.find_by(spelling: params[:spelling])
   end

   # Throws a 404 if user tries to delete a word that is not in the database
   def status
     if params[:spelling] && word.nil?
       404
     else
       delete_words
       204
     end
   end
 end
