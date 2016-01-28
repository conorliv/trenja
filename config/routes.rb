Rails.application.routes.draw do
  root 'home#show'
  resources :kanji, only: :index

  namespace :api do
    namespace :v1 do
      resources :kanji, only: :index
    end
  end
end
