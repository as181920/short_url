module ShortUrl
  module ShortenerService
    extend self

    def perform(original_url)
      link = Link.find_or_create_by!(original_url: original_url)
      ::ShortUrl::Engine.routes.url_helpers.short_url(link.short_id, host: ENVConfig.short_url_base_url)
    rescue => e
      Rails.logger.error "ShortUrl::ShortenerService perform #{e.class.name}: #{e.message}"
      nil
    end

    def fetch(short_id)
      Link.find_by(id: short_id.to_s.to_i(36))&.original_url
    end
  end
end
