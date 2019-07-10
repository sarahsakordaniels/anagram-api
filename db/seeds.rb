Word.destroy_all
Anagram.destroy_all


File.foreach('./lib/dictionary.txt') do |line|
  word = line.strip
  anagram = Anagram.find_or_create_by(key: word.downcase.split(//).sort.join)
  anagram.words.create(spelling: word)
end
