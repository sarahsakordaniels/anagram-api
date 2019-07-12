## Anagram API
An anagram is a word formed by another word by rearranging it's letters. For example, an anagram of "coat" is "taco". This API can be used to find any existing anagrams of a word, given it exists in the database!


## Setup
To set this up in your local envinronment...

1.	Run `bundle` to install any gems

2. Run `rails db:create`, `rails db:migrate` and `rails db:seed`. Seeding the full dictionary file of over 200,000 words would take quite some time, so I've provided a condensed option in lib/short_dictionary.txt. Searchable words to explore the functionality of the API include "read", "taco", and "cat". If desired, the full 200,000+ word file is available under full_dictionary.txt.

3. Run `rails s` to boot up the server on localhost:3000.

## Design
When deciding on what language/framework to utilize, I decided on Rails for it's wonderful "quick start" magic. Although I appreciate a good learning experience (which this still was), I do appreciate good time management and Rails does a good job of getting my projects up and going so I can spend more brain power on logic rather than setting up the basics.


I created two models, Anagram and Word. Anagram has the attribute of “key”, a word split into all letters and sorted alphabetically. Any word containing this set of letters is stored under this key. Anagrams have many words, and words belong to anagrams.

+ Ex. The word “taco” is will have the key “acot”. When the word “coat” is added to the database, it would also be stored under the key “acot”.

When first presented with this problem, I thought to implement logic that would take in a word parameter and search the entire database for other words that contain the same letters. However, this would be inefficient and take long time given a full dictionary database. With the user in mind, a more prompt result is delivered with the anagram key + word model.

## Using the API & Endpoints
A browser running localhost:3000 can be used for all GET requests.


To post and delete, utilize an API development environment/HTTP tool (ex. Postman)



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

## Future Implementations
Currently, the API only shows exact anagrams for a queried word. For example, when the word "dear" is queried, it will only return four-letter anagrams that contain exactly the letters d, e, a, and r - "read, "dare", and so on. I would like to implement logic that gives all the possible words that could be created from a given set of letters, much like the game Scrabble. So given the word "dear" again, it would return "read" and "dare" along with words like "rad", "red", "ad", and so on.
