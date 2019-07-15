## Anagram API
An anagram is a word formed by another word by rearranging it's letters. For example, an anagram of "coat" is "taco". This API can be used to find any existing anagrams of a word, given it exists in the database!


## Setup
To set this API up in your local envinronment...

1.	Run `bundle` to install any gems/dependencies.

2. Run `rails db:create`, `rails db:migrate`, and `rails db:seed`. 
  +Seeding the full dictionary file of over 200,000 words would take quite some time, so I've provided a condensed option in lib/short_dictionary.txt. Searchable words to explore the functionality of the API include "read", "taco", and "cat".
  + If desired, the full 200,000+ word file is available under "lib/full_dictionary.txt". Just change "short_dictionary" in the seed.rb file to "full_dictionary"

3. Run `rails s` to boot up the server on localhost:3000.


## Design
When deciding on what language/framework to utilize, I decided on Rails for it's wonderful "quick start" magic. Although I appreciate a quality learning experience (which this definitely still was!), I also value efficient time management. Rails effectively builds the foundation of my projects, allowing me more brain power to spend on logic rather than setting up the boilerplate.

I created two models, Anagram and Word. Anagram has the attribute of “key”, a word split into all letters and sorted alphabetically. Any word containing this set of letters is stored under this key. Anagrams have many words, and words belong to anagrams.

+ Ex. The word “taco” is will have the key “acot”. When the word “coat” is added to the database, it would also be stored under the key “acot”.

When first presented with this problem, I thought to implement logic that would take in the parameter of a word and search the entire database for other words that contain the same letters. However, this would be inefficient and take a long time given a full dictionary database. With the user in mind, a more prompt result is delivered with the anagram key + word model.


## Using the API & Endpoints
With the API running on localhost:3000, a browser can be used for all GET requests.

To POST and DELETE, utilize an API development environment/HTTP tool (ex. Postman)


`POST /words.json`
+ Takes a JSON array of English-language words and adds them to the database

![No Anagram Alert](https://lh3.googleusercontent.com/JZPd0sUi0wGNAP2OO2wrgC9TweCnUMu5p5KJ6XL9UMYc04S5Qflxx0v61813lunb0ftFu29w-aMMZlSFzSpXl6qvUfDQNf9BxVHUJhRo8DEXO22xxKxzWV2WaA-eCeG6Zccn8rbDAn4LVI0L1TsEAYJTYlDnEw5pMuSRnWVZxRbxpIhOtfiVrK-hu51KJS47fVKpJ2l70c4_h3lZWcZW5bS2bfEYKQgVbXZWSq_DikU18CWFkebp1idtADNKGAHZ79J1WFfks189clodSVTqKhxUdG9cWGd4mHDpn0edu_MGHCCZTFeEFvYm2w-Rz_Pa5HMTvg6DMEUofTrvD6tl8UKXKbSLUT9jItuEp3i3gjns7IeZUy4r534N3txorJacbjSuW65l-Qt2Uf3Z4sY7vGos85qCgJKWUkFWaahKbDLGdMzOuCfeH5rNzWwByBY29gqsSb79ICqT3W28wntBHHSpoBWT5RHNO90zkXYi5shSS3xT_Y6YE4ztKDOF-w-iAW8jZ9cgee7OgENPCn6BoQTHpWSL0TUnTtmmpS6hI4flQJt-zwtHcOf5RfKw3k58Go8LZkz-wSgdL1zBs2xhmLGZaB7ysFT5OnKPnLs2MLO6UHxCUvlbTKse1qMUtBTptAUqYqc9FnvRA5iuR2CTlhD4mJt2Sag=w886-h180-no)
![Word Does Not Exist Alert](https://lh3.googleusercontent.com/nDUf1hR5iTKS-brBWH-cUvHBP0JYwyyIQfSqp1vIjjZidP_TqvBH4rlJTAnIeEVX9e-qI_-fNoaGBpJOprEA-tGDeMthW1i1-khJEgZ7jSdJiDe3UW-03Ojt97U07oygHNPix7lGC_NGMccMG0DI2COta-hJEmUjjo1cd_EkLyO_Cv91LneKaBS6jxF4ba0Ym1m-VncVRXFM-ZnQ7CQKEfBytACpgVTv3aGotM0ieSLwA-6zgk-YFjmG4kiDLClHhqvvcfqDt5ZXoWw3wJwINXrlfPJusz6uCc8OkPsXMf7fcKN5ekIXWA1SuR5f9oOqng-VU71c1xUqA1Uv3Is2uUZBEPxk1zDLiD5SC07aKx6gMSFffz3h7WmcNVO0d4yvzcxIxSnXoRsnTtCBRob3oyJ8zqsA6VPME_jEHroLHlgGvRG_4LRPYH10VB1lx9ZmCuqLtFUGxYu4BGln6tkEj1uIA2bz-eIb93JDLNSkH1K7Gu3m4mHqTlpIseDsTP3q_t-B42zITr9HzouNbhmcZUkr34YNMgQg2BBs2-pCCc9lCtN4UdTJWzSzSjR2AETGNggcwaSmMTlCyWj_Atz4Rb0XedRpC_Wl4mHyQ6tr3Si1ShbiaIbZkSuMAJRotnVHz8iNOyAGPe9IecL2MbDY3q9fXc_I3k8=w844-h172-no)


`GET /anagrams/:word.json`
+ Returns a JSON array of English-language words that are anagrams of the word passed as a parameter in the URL.

`GET /anagrams/:word.json?limit=(number)`:
+ This endpoint supports an optional parameter that indicates the maximum number of queried results to return.

`DELETE /words/:word.json`:
+ Deletes a single word from the data store.

`DELETE /words.json`:
+ Deletes all contents of the data store.

`GET /words/data`
 + Endpoint that returns a count of words in the corpus and min/max/median/average word length

`GET words/most_anagrams`
+ Endpoint that identifies words with the most anagrams

## Future Implementations
Currently, the API only shows exact anagrams for a queried word. For example, when the word "dear" is passed as a parameter, the API will only return four-letter anagrams that contain exactly the letters d, e, a, and r - like "read", "dare", and so on. I would like to implement logic that returns all the possible words that could be created from a given set of letters, resembling how one would play Scrabble. So given the word "dear" again, it would return "read" and "dare" along with words like "rad", "red", "ad", etc.
