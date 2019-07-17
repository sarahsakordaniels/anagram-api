Rails.application.routes.draw do
  get '/anagrams/:term', to: 'anagrams#show'
  get '/words/data', to: 'words#data'
  get '/words/most_anagrams', to: 'words#most_anagrams'
  post '/words', to: 'words#create'
  delete '/words/:term', to: 'words#destroy'
  delete '/words', to: 'words#destroy'
end
