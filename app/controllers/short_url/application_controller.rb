module ShortUrl
  class ApplicationController < ActionController::Base
    include UrlUtility
    include AuthGuard

    protect_from_forgery with: :null_session
  end
end
