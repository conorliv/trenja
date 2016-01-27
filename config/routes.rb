Rails.application.routes.draw do
  root 'home#show'
  resources :kanji, only: :index

  namespace :api do
    namespace :v1 do
      get 'trending', to: 'kanji#trending'
    end
  end
end
