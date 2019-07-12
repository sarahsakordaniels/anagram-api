<h2>Anagram API</h2>
An anagram is a word formed by another word by rearranging letters. For example, an anagram of "coat" is "taco". This API can be used to find any existing anagrams of a word, given it exists in the database!
<br>
<h2>Setup</h2>
To set this up in your local envinronment...<br><br>
1. Run "bundle" to install any gems<br><br>
2. Run rails db:create, rails db:migrate and rails db:seed. Seeding the full dictionary file of over 200,00 words would take quite some time, so I've provided a condensed option in lib/dictionary.txt. Searchable words to explore the functionality of the API include "read", "taco", and "cat".<br><br>
3. Run "rails s" to boot up the server on localhost:3000. 
<br>
<h2>Design</h2>
When deciding on what langauge/framework to utilize, I decided on Rails for it's wonderful "quick start" magic. Although I appreciate a good learning experience (which this still was), I do appreciate good time management and Rails does a good job of getting my projects up and going so I can spend more brain power on logic rather than setting up the basics.
<br>
<h2>Using the API</h2>
For get requests, use localhost:3000/anagrams/:word to find anagrams of the passed word. <br>
To post and delete, utilize an API development environment/HTTP tool (ex. Postman)
<br><br>
*put endpoints and examples here*

