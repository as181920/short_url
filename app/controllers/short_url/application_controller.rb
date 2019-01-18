module ShortUrl
  class ApplicationController < ActionController::Base
    include AuthGuard

    protect_from_forgery with: :null_session
  end
end
