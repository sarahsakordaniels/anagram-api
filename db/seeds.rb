
File.foreach('./lib/dictionary.txt') do |line|
  word = line.strip
  anagram = Anagram.find_or_create_by(key: word.downcase.chars.sort.join)
end


File.foreach('./lib/dictionary.txt') do |line|
  word = line.strip
  Word.find_or_create_by(spelling: word)
end
