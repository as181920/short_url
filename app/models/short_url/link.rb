module ShortUrl
  class Link < ApplicationRecord
    validates :original_url, presence: true, uniqueness: true, format: {with:  URI::regexp(%w(http https))}

    def short_id
      id&.to_s(36)
    end
  end
end
