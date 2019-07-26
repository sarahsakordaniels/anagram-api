# Anagram-A-Rama



<img src="https://lh3.googleusercontent.com/DLeTDqJUDSYn3FMh_Rl1ZxVWWUFbdaevG8_nmYRhgGDx0BLNPaywGc5wLm_QtJS7s3GOXBlD-UPZLXc-gR-ybAZFQ9uCLgjdsyPdgEUynnp0s73jQjFFnNMC87BB3NNKJF4h36EJ-wfPe18C7bfGQqSbI7DJMHQjCP1qEOqdbgbWxbvM3KrFnMYwiC0FxRlEvXgEu-4rcym8H5k20Lroh6jaK_cohDzHK4hUJt13R7msOMIx_WLl8Eki4hFiRh1m4C5WqfBOSfx04LbXcXIbNVKUrXfF-IvQzZSuFcN83oQxjNFynrFU2SvK0AXPAG9ZLKTUIf2_NvvM9CF8E0j8plgneG1a2mEcA5f3wsMqJfxo38kjS5mDK-Rwb5Ru9D1GOV0MnnMG-ZsKYY92-Tnbr6FUsnEVdYFoA-b4izMXHPIRfmyPaLdW0UfG3ToJ1tg9mPvQVwF0zCBc3SUQ2XWWhpoTyvTmjFJ0atwKu6D0y99D9e-2zRq63w-IUVYcatOWnYtU1DgZgModmm46LKlW-0KYPbcTQrLvx6rWs_lK8wNdrQpxrG_0fO0YusTnmaPZz7jeytLKWs-y4rYQv5gQpCTH-4sywGt5_sHDfs9EB_R5wdK6nOzbITu9M0_3WEu2lx6ocmfGHTSQbf5s4TA-75MDF5gZzdE=w1612-h464-no" width="75%" height="75%" title="Source: https://www.merriam-webster.com/dictionary/anagram">

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
<img src="https://lh3.googleusercontent.com/cd8IAirOIE_TYGiYPnIIfQkFVtMiePqdAAcQX_Wa-NwkLbHpsbTPmccoQ3L7VrQ-mBHAi4u2Pyb7akAW59IcRghkkgED9jgvcQm3ERN0nUvM4CU3N1XHE39ISLnpeDYXTrrSVN7NnfRPJdYrPGTC1aylmrWdIIfVe5XR_rP4M-UfQVdHj4o_e7XTtIhCY83ILfaJ7Dt-YKis55nPKzgi624NPcvWAbP6Jiu3woHp4CaFVUzp0nGo7zoF635Udt7rkM4pyoj-7Xj_eCurCj7WS-8Y4rAl1ftZFZrxPvQYNgZpmU6937-yS9YJWTINd2ZAG2bnkpp-B_5ATR0oxhiSroJb2MherD3CWUTeVVBbWI8BxXOY_p21r8UeWhl6Yht_KpO7bv6W_H1kipixbttZAyQnhx3RS7GThwrHRbsEGV72GFyO-p7I7nvjDS59ufGS39PGPQvHCFT_57hQtpIvmjTBNkUrSS_rSMEFcqvYjrPllY_8FqnvafBQkhug5IOfj28OsNmvpK9d0YbDnrO_U8NBEiTnIr6VmqVcGgCioWzchwvR45p3ITHuLZjoghmP_dfTR2JEtU3aE4uDwCCY4VDRwvklCbF46nO9a5la4E3BX0QO1Zg-rr4qffw1HHLsJ9b9PVPjwpJRFbWtlYDvdoEGNb_5_Ek=w1010-h350-no" width="50%" height="50%" title="anagram model"></p>
<br>
<p align="center">
<img src="https://lh3.googleusercontent.com/qNi06Dq4VcHCRROqNsR78phxI1lfAB_KCFxBGh9uSstdkwVeknUaVDIj-9KAnf-CYxFANenQ3osGl1Kg2R-aZojP6O-SznHNmDGZnUlUnMR0_qcRgoAFbRnPUuZK9ZCEonfwCc08mJW7odEgAbJ4mZVEvpkBa9xFfVRt-lzhSVdMmMJi1xLYXMlIfxGGLrgvnrNAbRJV2EU74fdezYk4BW5mQEyKsEA1eQJhUwy-u29uKm8zLqd-mTgKJNQXliKU60-YD5AE9pGKgdMvDs8wBcvDsM43ym0-FdSaA68XL47ZSv5-k0F6LAGcA8qxcOOdSqt6R0mH1npU1SqDWZ-kUITmtQG10FC8QtT92AGhy7CbiCw0-j-U1bI-D3crHQRuwPpBpUPqx1G4YbihWkYMbOsyZv6lMmZzG8mMLSoza9sQ-80Z6eAl8fQuphwIcFL-LNgWiEt0WtaO8R_x0eS4k_V9TOLlzR6BSWwl_1FZY3YhqeqABbyfDkGtST9IOx5BD9vh4SneiGueLc-7fXwbnK2NwzDeHQIKmQJYGn8iVWocUlH1LdCq--pieTpBjx0lHF9esgi-rnRPuYuVXFT6YqKDQ6GPLanCXI3gnQuRz1otkaFIGjEDV3glypuw129u4NCq9He3ax-H09PX9P1LjlOQ0f9LnpQ=w850-h376-no" width="50%" height="50%" title="word model"></p>

  + Example: The word “game” will have the *key* “aegm”. When the word “mega” is added to the database, it would also be stored under the *key* “aegm”.




<br>


When first presented with this problem, I thought to implement logic that would take in the parameter of a word and search the entire database for other words that contain the same letters. However, this would be inefficient and take a long time given a full dictionary database. With the user in mind, a more prompt result is delivered with the anagram key + word model.
***
<br>
<p align="center">
<img src="https://lh3.googleusercontent.com/-NIXuLSO2TO3tR8_Kr_VKtps2APfCSyuYfiT7vb0WMPa_X7SjvE_T9a3SmOqe6qLDraoafNw7WKV7lrhl06Krr2e8lM-mRJ9Kc6PflBHJZ6aTPWFnIPTr2Sea2SJqyRlWGlb5QZPfp2ziWcq2ijIxH14kUlMLLOj2Gan7N52Kt0cbmJoB6nfpxEdf5yv2ySwaN46ycx9ytWa54y-vzolXRXavASWVTWIFbEcyEbj9-5jrxF4TVj9Y53x2n1SHeZWOeyGL6tNfSar_j4HDo0GYfTNxGGs6FXT_K1Z275lKJ885AaapdWS_0QGxd4IwjJ_p5-nnMeHVTZl_9QCJtqiBgEUhzKBhe8V502VDbd_HrBUX8Cx1m7p_7Vub9cQ539-B_4KHPsanfnHO4WpTfnHv69GPsHXf0xUvg4i_MmxLHXfHWiPWZvxE26wGbQRtLSTxHB-OsXOrXiYUV0-3gsb6pDh2PiZwcg-mtMiAm6ffJaEqAmIfGH2LQYNq4v2lPokBj89gLymbix6X-XylOwnILG9UsBN-hLz-a_JQWJkaXg25VeE4YDOiHvvC6DeiNvLb2UuoV3hCU523ZngVgKcBUBf8zv-to8LQ4aaneMDb8-QcF_7HXdanLE4urU8s4h3tuswFMJ0cqSal9VF-rgoTNW_lXsYBsw=w1388-h250-no" width="75%" height="75%" title="seed file"></p>
<p align="center"><i>Upon seeding, keys are created and words are matched with the appropriate key.</i></p>

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
