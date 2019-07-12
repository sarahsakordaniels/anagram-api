Rails.application.routes.draw do
  get '/anagrams/:spelling', to: 'anagrams#show'
  get '/words/data', to: 'words#data'
  post '/words', to: 'words#create'
  delete '/words/:spelling', to: 'words#destroy'
  delete '/words', to: 'words#destroy'
end
