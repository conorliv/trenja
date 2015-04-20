Rails.application.routes.draw do
  root 'kanji#index'
  get 'update_counts', to: 'kanji#update_counts'
  get 'update_sources', to: 'kanji#update_sources'
end
