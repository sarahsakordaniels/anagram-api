# Anagram API



<br>

***This API can be used to find any existing anagrams of a word, given it exists in the database!***

<br>

# Setup
To set this API up in your local envinronment...

1.	Run `bundle` to install any gems/dependencies.

2. Run `rails db:create`, `rails db:migrate`, and `rails db:seed`. 
  
    + Seeding the full dictionary file of over 200,000 words would take quite some time, so I've provided a condensed option in lib/short_dictionary.txt. Searchable words to explore the functionality of the API include "read", "taco", and "cat".
 
    + If desired, the full 200,000+ word file is available under "lib/full_dictionary.txt". Just change "short_dictionary" in the seed.rb file to "full_dictionary"

3. Run `rails s` to boot up the server on localhost:3000.


<br>

# Design
When deciding on what language/framework to utilize, I decided on Rails for it's wonderful "quick start" magic. Although I appreciate a quality learning experience (which this definitely still was!), I also value efficient time management. Rails effectively builds the foundation of my projects, allowing me more brain power to spend on logic rather than setting up the boilerplate.

I created two models, ***anagram*** and ***word***. Anagram has the attribute of *key*, a word split into all letters and sorted alphabetically. Any word containing this set of letters (under an attribute called *term*, the actual word) is stored under this key. Anagrams have many words, and words belong to anagrams.


<p align="center">


  + Example: The word “game” will have the *key* “aegm”. When the word “mega” is added to the database, it would also be stored under the *key* “aegm”.




<br>


When first presented with this problem, I thought to implement logic that would take in the parameter of a word and search the entire database for other words that contain the same letters. However, this would be inefficient and take a long time given a full dictionary database. With the user in mind, a more prompt result is delivered with the anagram key + word model.
***
<br>

<br>

# Using the API & Endpoints
With the API running on localhost:3000, a browser can be used for all GET requests.

To POST and DELETE, utilize an API development environment/HTTP tool (ex. Postman)

<br>

#### ***`POST /words.json`***
***
+ Takes a JSON array of English-language words and adds them to the database


<br><br>


#### ***`GET /anagrams/:word.json`***
***
+ Returns a JSON array of English-language words that are anagrams of the word passed as a parameter in the URL.
<br>
<p align="center"><i>If the queried word does not have any anagrams in the database...</i></p>


<br>

<p align="center"><i>If the queried word does not exist in the database...</i></p>

<br><br>

#### ***`GET /anagrams/:word.json?limit=(number)`:***
***
+ This endpoint supports an optional parameter that indicates the maximum number of queried results to return.


<br><br>


#### ***`DELETE /words/:word.json`:***
***
+ Deletes a single word from the data store.


<br><br>


#### ***`DELETE /words.json`:***
***
+ Deletes all contents of the data store.


<br><br>


#### ***`GET /words/data`***
***
 + Endpoint that returns a count of words in the corpus and min/max/median/average word length



<br><br>


#### ***`GET words/most_anagrams`***
***
+ Endpoint that identifies words with the most anagrams


<br>

# Future Implementations
Currently, the API only shows exact anagrams for a queried word. For example, when the word "dear" is passed as a parameter, the API will only return four-letter anagrams that contain exactly the letters d, e, a, and r - like "read", "dare", and so on. I would like to implement logic that returns all the possible words that could be created from a given set of letters, resembling how one would play Scrabble. So given the word "dear" again, it would return "read" and "dare" along with words like "rad", "red", "ad", etc.
