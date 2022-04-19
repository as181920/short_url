module ShortUrl
  module UrlUtility
    extend ActiveSupport::Concern

    included do
      helper_method :url_with_additional_params
      helper_method :url_by_shorten
    end

    private

      def url_with_additional_params(url, params = {})
        Addressable::URI.parse(url).tap { |uri| uri.query = Rack::Utils.parse_nested_query(uri.query).deep_merge(params).to_query.presence }.to_s
      end

      def url_with_stripped_params(url, keys = [])
        Addressable::URI.parse(url).tap { |uri| uri.query = Rack::Utils.parse_nested_query(uri.query).except(*keys.map(&:to_s)).to_query.presence }.to_s
      end

      def url_by_shorten(url, keep_keys: [])
        shorten_url = ShortUrl::ShortenerService.perform(url_with_stripped_params(url, keep_keys))
        keep_params = Rack::Utils.parse_nested_query(Addressable::URI.parse(url).query).slice(*keep_keys.map(&:to_s)).compact_blank
        Addressable::URI.parse(shorten_url).tap { |uri| uri.query = keep_params.to_query.presence }.to_s
      end
  end
end
