ShortUrl::Engine.routes.draw do
  root to: "links#index"

  get "/:short_id", to: "links#show", as: :short
  resources :links, only: [:index, :create]
end
