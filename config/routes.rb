Rails.application.routes.draw do
  get '/anagrams/:spelling', to: 'anagrams#show'
  resources :words, only: [:create]
  # post '/words/:spelling', to '#words#create'
  delete '/words/:spelling', to: 'words#destroy'
  delete '/words', to: 'words#destroy'
end
