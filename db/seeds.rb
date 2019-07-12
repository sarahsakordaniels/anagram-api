Word.destroy_all
Anagram.destroy_all

#If a key (a split and alphabetized version of the word) is not found for the word, it is created and the word is assigned to that key
#If a key exists, the word is assigned to that existing key

File.foreach('./lib/short_dictionary.txt') do |line|
  word = line.strip
  anagram = Anagram.find_or_create_by(key: word.downcase.split(//).sort.join)
  anagram.words.create(spelling: word)
end
