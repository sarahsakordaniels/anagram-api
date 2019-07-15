# Anagram API


<p align="center">
<img src="https://lh3.googleusercontent.com/DLeTDqJUDSYn3FMh_Rl1ZxVWWUFbdaevG8_nmYRhgGDx0BLNPaywGc5wLm_QtJS7s3GOXBlD-UPZLXc-gR-ybAZFQ9uCLgjdsyPdgEUynnp0s73jQjFFnNMC87BB3NNKJF4h36EJ-wfPe18C7bfGQqSbI7DJMHQjCP1qEOqdbgbWxbvM3KrFnMYwiC0FxRlEvXgEu-4rcym8H5k20Lroh6jaK_cohDzHK4hUJt13R7msOMIx_WLl8Eki4hFiRh1m4C5WqfBOSfx04LbXcXIbNVKUrXfF-IvQzZSuFcN83oQxjNFynrFU2SvK0AXPAG9ZLKTUIf2_NvvM9CF8E0j8plgneG1a2mEcA5f3wsMqJfxo38kjS5mDK-Rwb5Ru9D1GOV0MnnMG-ZsKYY92-Tnbr6FUsnEVdYFoA-b4izMXHPIRfmyPaLdW0UfG3ToJ1tg9mPvQVwF0zCBc3SUQ2XWWhpoTyvTmjFJ0atwKu6D0y99D9e-2zRq63w-IUVYcatOWnYtU1DgZgModmm46LKlW-0KYPbcTQrLvx6rWs_lK8wNdrQpxrG_0fO0YusTnmaPZz7jeytLKWs-y4rYQv5gQpCTH-4sywGt5_sHDfs9EB_R5wdK6nOzbITu9M0_3WEu2lx6ocmfGHTSQbf5s4TA-75MDF5gZzdE=w1612-h464-no" width="75%" height="75%" title="Source: https://www.merriam-webster.com/dictionary/anagram"></p>

<br>

***This API can be used to find any existing anagrams of a word, given it exists in the database!***

<br>

# Setup
To set this API up in your local envinronment...

1.	Run `bundle` to install any gems/dependencies.

2. Run `rails db:create`, `rails db:migrate`, and `rails db:seed`. 
  +Seeding the full dictionary file of over 200,000 words would take quite some time, so I've provided a condensed option in lib/short_dictionary.txt. Searchable words to explore the functionality of the API include "read", "taco", and "cat".
  + If desired, the full 200,000+ word file is available under "lib/full_dictionary.txt". Just change "short_dictionary" in the seed.rb file to "full_dictionary"

3. Run `rails s` to boot up the server on localhost:3000.


<br>

# Design
When deciding on what language/framework to utilize, I decided on Rails for it's wonderful "quick start" magic. Although I appreciate a quality learning experience (which this definitely still was!), I also value efficient time management. Rails effectively builds the foundation of my projects, allowing me more brain power to spend on logic rather than setting up the boilerplate.

I created two models, ***anagram*** and ***word***. Anagram has the attribute of *key*, a word split into all letters and sorted alphabetically. Any word containing this set of letters (under an attribute called *spelling*) is stored under this key. Anagrams have many words, and words belong to anagrams.

+ Ex. The word “taco” is will have the *key* “acot”. When the word “coat” is added to the database, it would also be stored under the *key* “acot”.

<p align="center">
<img src="https://lh3.googleusercontent.com/cd8IAirOIE_TYGiYPnIIfQkFVtMiePqdAAcQX_Wa-NwkLbHpsbTPmccoQ3L7VrQ-mBHAi4u2Pyb7akAW59IcRghkkgED9jgvcQm3ERN0nUvM4CU3N1XHE39ISLnpeDYXTrrSVN7NnfRPJdYrPGTC1aylmrWdIIfVe5XR_rP4M-UfQVdHj4o_e7XTtIhCY83ILfaJ7Dt-YKis55nPKzgi624NPcvWAbP6Jiu3woHp4CaFVUzp0nGo7zoF635Udt7rkM4pyoj-7Xj_eCurCj7WS-8Y4rAl1ftZFZrxPvQYNgZpmU6937-yS9YJWTINd2ZAG2bnkpp-B_5ATR0oxhiSroJb2MherD3CWUTeVVBbWI8BxXOY_p21r8UeWhl6Yht_KpO7bv6W_H1kipixbttZAyQnhx3RS7GThwrHRbsEGV72GFyO-p7I7nvjDS59ufGS39PGPQvHCFT_57hQtpIvmjTBNkUrSS_rSMEFcqvYjrPllY_8FqnvafBQkhug5IOfj28OsNmvpK9d0YbDnrO_U8NBEiTnIr6VmqVcGgCioWzchwvR45p3ITHuLZjoghmP_dfTR2JEtU3aE4uDwCCY4VDRwvklCbF46nO9a5la4E3BX0QO1Zg-rr4qffw1HHLsJ9b9PVPjwpJRFbWtlYDvdoEGNb_5_Ek=w1010-h350-no" width="50%" height="50%" title="anagram model"></p>
<br>
<p align="center">
<img src="https://lh3.googleusercontent.com/xezt6wrYqjJFaCYGrk2wLpIwfG2Ta7WRCrtmLq4_sKKEg3MrXIsBb6TSMTNI7wG1R5HA5jYrDt3EaXvPyfC-SmYycO-Sg8BO5MZZRlcJAGH3_mJY7XVnKwcaAKxFuYEp9nys00qZdGTjHKkgdA9J6eP9o9qr6mDEO0sf5PPZd-4yqwXu-wuo36DlT_ke7mcUffXpyXVDE9rQ7TeE7RZ1PUe16eDWFjrC7AZdmFRs_MFK3-wpa31DXF2wl2FOcj1z9MVNgxpWPV3zvqQvCx6Y3wo4eek0-N3JexM_rqBYHpyOEVNZVhaupJTAVxDLY5iZpzkI-c_VknQ2o--aUwPWD9-ltymJovlZ_j02LvbGDwuUH9jM-pKs2wkXakfQ8kniwwI_RLM1QGdl5_SnIj-YxkFl_4bWuMrjOUw1A-cvvJjUnVi54WtPVYbI7S5imVHAb2HxzdJQTspPknGOoAHFt_5ao9esBOYv0PuBTY9AP2dHu_hDiF-KpMPVHuk4vI5zQFXT0KIwD6H5tsxSZoN1cgzBgYoNospotWkXL1t1BsinzD5MwMqOaOdWtPvQQR9qdSDM4gHql9UHF78rufyeTAEK3n5q0K5eV2p9-60A7_6tT15S8DBDQLPekQ48UyZnoP-3GFCPUsiKRXW25ujCmwmVE42qPbM=w1024-h340-no" width="50%" height="50%" title="word model"></p>


When first presented with this problem, I thought to implement logic that would take in the parameter of a word and search the entire database for other words that contain the same letters. However, this would be inefficient and take a long time given a full dictionary database. With the user in mind, a more prompt result is delivered with the anagram key + word model.
***
<br>
<p align="center">
<img src="https://lh3.googleusercontent.com/owNsyL9vI8xMMh-Re_0Bzp7n3felAbrCB7d9hCq7MFBjNMYHUyegii3hNzPQluz50CmMRKNWYUz-rhwpzSeQwQr9scQr0tYtOwR2v-z5r--q0jQyorOAyysZ6WnudjIV0h8RzJXcjJ7yko-2Z7Boi4BTEttdROrMEI-jrKzFomvTe-i74c6Hg8CDQk0pygj_tLoH_t7OTzyxtyh1ARLqt-Z1ISdY_dXIICAQKMjIdnlA92wYTpJTmLUJhHosy6i8ui9aDi3sfa1zc2sr_0FbigTfWsZiOunLvXb622HjifmXvUm9I9CDE58u4NrIChhLC2fo-tPPeimempnwtDhR36TZH3O0XF1z07xGOdsHVWETCTbgl7RIi5My2dvzi1O8RpgTmuqJg0T1R7r4AOFvdS8baNgMFnCPS9VAzJdV1jdAb1y7qCN12dtVWHkU8u9xu6OFIB_cQPSUEHlZznm2IwkkCxDFcYhMWkUk-xfvGVRiZRNTGxEataQIRRnq4MPmiNokgwdps4wCS5u_SLOyLWgROF55smUDBHQ61dusDTII3fOvdPov_3Tt7Z18TKn1TSKHHMXvmE9fuNWPspIgld3fDq1eYRf_vLsxxzo-gacGpjJbzYaVk2XMnVNmIn8nBfMD3qGQjAz1eTqscbB5c5iBA1Ym2NM=w1422-h312-no" width="75%" height="75%" title="seed file"></p>
<p align="center"><i>Upon seeding, keys are created and words are matched with the appropriate key.</i></p>

<br>

# Using the API & Endpoints
With the API running on localhost:3000, a browser can be used for all GET requests.

To POST and DELETE, utilize an API development environment/HTTP tool (ex. Postman)

<br>

#### ***`POST /words.json`***
***
+ Takes a JSON array of English-language words and adds them to the database
<p align="center">
<img src="https://lh3.googleusercontent.com/_m75vFcFeLWv7Par3Lfgfl-MUJRVsJO-BQU4dYviywUfzPGrRN0Yy1KDCx6_-e6cZNgTJT75jOWMKJY7p4RhT49lg-rxf19vubTwjkedy7xWLOwEzdGEDKKYWDbQFsJjeygNEXiiTnN0Kw7PMp35Bszz7NTs6owhtcFG4knO2NeI51EZwzTA39Dx2yiDbaToqcvkRWCLgYwHN-0KoY7I-Xs38rg487fe5SjNG58SNHTojkEtLevSeeAoR6g24VTkHxBGGX7uIW9CG7GEUpye6K2s2MvvWjaDDR33_YCAAl5r4SeRf6RQknaPsyR8aeg-eQcw55JhYEvrUIV__J2yr8wR_HuygFKIMlZGiWApRXmEUxynfIiLcNqK-5WsoQaxjRhACDJNviF5OXlun-gzFOkXY2SCUrKYkx1glcG-qJPsEdO6G-h6ob0kuMIMOTMUuux0aO9B1ha3xFSVQxAWEdrVcW7msjR2EH6Qj93rjlXl2-nuxD6WpjoMIze1UCYaYxUXRL_dU9wRblXszqN1_MT0sd_PcZ8zJHrQZNWcZ3ufJd6mhPkSlQZASnI0uzDGlxSJR3dDl2wuyrXVZFTb9EXq5oSNpN7JTljqklsA-AlqgdBbIFddWFNZYhazxRXO-Ij9K6Fm4hDIHmggb4g5_v6xCzTymtY=w2012-h602-no" width="100%" height="100%" title="post example"></p>


<br><br>


#### ***`GET /anagrams/:word.json`***
***
+ Returns a JSON array of English-language words that are anagrams of the word passed as a parameter in the URL.
<br>
<p align="center"><i>If the queried word does not have any anagrams in the database...</i></p>
<p align="center">
<img src="https://lh3.googleusercontent.com/nDUf1hR5iTKS-brBWH-cUvHBP0JYwyyIQfSqp1vIjjZidP_TqvBH4rlJTAnIeEVX9e-qI_-fNoaGBpJOprEA-tGDeMthW1i1-khJEgZ7jSdJiDe3UW-03Ojt97U07oygHNPix7lGC_NGMccMG0DI2COta-hJEmUjjo1cd_EkLyO_Cv91LneKaBS6jxF4ba0Ym1m-VncVRXFM-ZnQ7CQKEfBytACpgVTv3aGotM0ieSLwA-6zgk-YFjmG4kiDLClHhqvvcfqDt5ZXoWw3wJwINXrlfPJusz6uCc8OkPsXMf7fcKN5ekIXWA1SuR5f9oOqng-VU71c1xUqA1Uv3Is2uUZBEPxk1zDLiD5SC07aKx6gMSFffz3h7WmcNVO0d4yvzcxIxSnXoRsnTtCBRob3oyJ8zqsA6VPME_jEHroLHlgGvRG_4LRPYH10VB1lx9ZmCuqLtFUGxYu4BGln6tkEj1uIA2bz-eIb93JDLNSkH1K7Gu3m4mHqTlpIseDsTP3q_t-B42zITr9HzouNbhmcZUkr34YNMgQg2BBs2-pCCc9lCtN4UdTJWzSzSjR2AETGNggcwaSmMTlCyWj_Atz4Rb0XedRpC_Wl4mHyQ6tr3Si1ShbiaIbZkSuMAJRotnVHz8iNOyAGPe9IecL2MbDY3q9fXc_I3k8=w844-h172-no" width="50%" height="50%" title="word does not have any anagrams"></p>

<br>

<p align="center"><i>If the queried word does not exist in the database...</i></p>
<p align="center">
<img
src="https://lh3.googleusercontent.com/JZPd0sUi0wGNAP2OO2wrgC9TweCnUMu5p5KJ6XL9UMYc04S5Qflxx0v61813lunb0ftFu29w-aMMZlSFzSpXl6qvUfDQNf9BxVHUJhRo8DEXO22xxKxzWV2WaA-eCeG6Zccn8rbDAn4LVI0L1TsEAYJTYlDnEw5pMuSRnWVZxRbxpIhOtfiVrK-hu51KJS47fVKpJ2l70c4_h3lZWcZW5bS2bfEYKQgVbXZWSq_DikU18CWFkebp1idtADNKGAHZ79J1WFfks189clodSVTqKhxUdG9cWGd4mHDpn0edu_MGHCCZTFeEFvYm2w-Rz_Pa5HMTvg6DMEUofTrvD6tl8UKXKbSLUT9jItuEp3i3gjns7IeZUy4r534N3txorJacbjSuW65l-Qt2Uf3Z4sY7vGos85qCgJKWUkFWaahKbDLGdMzOuCfeH5rNzWwByBY29gqsSb79ICqT3W28wntBHHSpoBWT5RHNO90zkXYi5shSS3xT_Y6YE4ztKDOF-w-iAW8jZ9cgee7OgENPCn6BoQTHpWSL0TUnTtmmpS6hI4flQJt-zwtHcOf5RfKw3k58Go8LZkz-wSgdL1zBs2xhmLGZaB7ysFT5OnKPnLs2MLO6UHxCUvlbTKse1qMUtBTptAUqYqc9FnvRA5iuR2CTlhD4mJt2Sag=w886-h180-no" width="50%" height="50%" title="word does not exist"></p>
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
 <p align="center">
<img src="https://lh3.googleusercontent.com/7fNRJilXk0eT2U_Dc90WkPo8t1_UwRyxTYl4g3-Zz53n-mjt1YOpCA3hbYnfo24dlma4jRIgzRVCKEctM8tyLAstQrhWUIdu3yCXoBVU_8J0SBWPq1UlmKxV85VOPZopKHSwCsdiZpQblp9eVmHvRloVN_zwSdKLyp1pOAW3r9V3D9d0lqiP3lvzRqIpWljqNwsnHhL8EEmOyVhPWJrjNmejUb0VgA6QZUhqlTfH9yPnEzMaWwNhcjm-XV6V8qmGJx_xUX0ewSz5Fdl9gBbvaAcDnbwuQ4Gz5v-dWuAkL9zNDMB1CHRKM9BUfDgfo_iRwCJKKXZL79r3FV3sP-9_7iHr0tSkkpBZpvbyRBmmfLY3VI3zI87goHOKs-itFBLgsfxNYl_a61m1iLGIZeXwVQeMF1J2OruGYJ8l0ay_VM9Ng2mRlWD7R4n7GuKpCWAEhH18kWYpUi-c0hH53W81pt_R-_KRfoYqR9jOZ3SHzx6wexZ7GJ3y_EryXIxPGrgwBM52VmeBfpW-aviqFsjnv3I0J8z4vDvLvgIT5uVpwilYdcMJsUsx6iW1z5sqZnvKfRM0h9RE19tGGFKkVM4-O38SV4g77kgPruFO4fXnXkQCopCKpe8kmZTQutndS-lgfePlbo7d0WHMfM_0TH2a1Q-75xV8zpQ=w572-h278-no" width="50%" height="50%" title="data example"></p>


<br><br>


#### ***`GET words/most_anagrams`***
***
+ Endpoint that identifies words with the most anagrams
 <p align="center">
<img src="https://lh3.googleusercontent.com/9jGnDLcZtT10fKhY9P2lwcdA4R3NLtVw0gxEd6nwdZrWQBZGVPhRHrBSva20-_uDXCgmcavEaasELkPDoO9bVzFqisrMMKEWzHpixztlPHkV9my-rvDESbkLSRRDSBR-XC2tZLxb8Us-SdIdqpblkjWBG48WVO0c1JIDdUWNBD7kgcp9Q9KSsScNZglkzu9ShhFXwWHp_-5IV4Uz4jXJ7E2-BPyvIPXacrbTBTcHREoMgyNp7uaa9Q4uV8G6ggS-Qo1XMi2BGcJjJ_f26p20NGX-bcHWkb8NLit1vDZSBj-7T8PhsVdCOcJK-tmldHo5WGGLdB3QN6vbBZe0sXzzbrxTS-Y6v7Tb_m_O5jJsv-KVXtTO2DMlDZOHt1AXwpov8GdbsjR2JpecyFQp8uFuyhkWjkrbPnOeCiAlLWpKljuru8Az3p9aqTi7UCEVgVhs3qNUWzbncc1-jFc45OB1B8fGhoBhgPUOSfz6SusSb9UGA3ZH2gfv8ha71xTjOXHWcwivi4cONGSI7bEjkeo_hhbKa4Es8F776_4y889PXnuWPlSsyVE62EvvqPF-MDIAvCw5MW6UpnjnO_36Hz_JBODScNjkid2r2Q4uwP2vlDvStK2G_iECWUFcrktHPOclxwrEHCc1-ASOot5tfPg-kfpna_q-kYY=w676-h278-no" width="50%" height="50%" title="data example"></p>

<br>


# Future Implementations
Currently, the API only shows exact anagrams for a queried word. For example, when the word "dear" is passed as a parameter, the API will only return four-letter anagrams that contain exactly the letters d, e, a, and r - like "read", "dare", and so on. I would like to implement logic that returns all the possible words that could be created from a given set of letters, resembling how one would play Scrabble. So given the word "dear" again, it would return "read" and "dare" along with words like "rad", "red", "ad", etc.
