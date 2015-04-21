Rails.application.routes.draw do
  root 'home#show'
  resources :kanji, only: :index
  get 'update_counts', to: 'kanji#update_counts'
  get 'update_sources', to: 'kanji#update_sources'
end
