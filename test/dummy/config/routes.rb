Rails.application.routes.draw do
  mount ShortUrl::Engine => "/short_url"
end
