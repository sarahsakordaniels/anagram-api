Rails.application.routes.draw do
  resources :words, only: [:create]
  delete '/words/:spelling', to: 'words#destroy'
  delete '/words', to: 'words#destroy'
  get '/anagrams/:spelling', to: 'anagrams#index'
end
