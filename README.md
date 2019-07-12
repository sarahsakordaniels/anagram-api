<h2>Anagram API</h2>
An anagram is a word formed by another word by rearranging letters. For example, an anagram of "coat" is "taco". This API can be used to find any existing anagrams of a word, given it exists in the database!
<br>
<h2>Setup</h2>
To set this up in your local envinronment...
<br><br>
1.	Run `bundle` to install any gems
<br><br>
2. Run `rails db:create`, `rails db:migrate` and `rails db:seed`. Seeding the full dictionary file of over 200,00 words would take quite some time, so I've provided a condensed option in lib/dictionary.txt. Searchable words to explore the functionality of the API include "read", "taco", and "cat".<br><br>
3. Run `rails s` to boot up the server on localhost:3000. 
<br>
<h2>Design</h2>
When deciding on what language/framework to utilize, I decided on Rails for it's wonderful "quick start" magic. Although I appreciate a good learning experience (which this still was), I do appreciate good time management and Rails does a good job of getting my projects up and going so I can spend more brain power on logic rather than setting up the basics.
<br>
I created two models, Anagram and Word. Anagram has the attribute of “key”, a word split into all letters and sorted alphabetically. Any word containing this set of letters is stored under this key. Anagrams have many words, and words belong to anagrams.
<br>
Ex. The word “taco” is will have the key “acot”. When the word “coat” is added to the database, it would also be stored under the key “acot”.

<br>
<h2>Using the API & Endpoints</h2>
A browser running localhost:3000 can be used for all GET requests.
 <br>
To post and delete, utilize an API development environment/HTTP tool (ex. Postman)
<br><br>

`POST /words.json`
+ Takes a JSON array of English-language words and adds them to the database

`GET /anagrams/:word.json`
+ Returns a JSON array of English-language words that are anagrams of the word passed in the URL.

`GET /anagrams/:word.json?limit=(number)`:
+ This endpoint supports an optional query param that indicates the maximum number of results to return.

`DELETE /words/:word.json`: 
+ Deletes a single word from the data store.

`DELETE /words.json`:
+ Deletes all contents of the data store.

`GET /words/data`
 + Endpoint that returns a count of words in the corpus and min/max/median/average word length

`GET words/most_anagrams`
+ Endpoint that identifies words with the most anagrams

