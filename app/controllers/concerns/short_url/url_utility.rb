module ShortUrl
  module UrlUtility
    private

      def url_with_additional_params(url, params = {})
        URI(url).tap { |uri| uri.query = Rack::Utils.parse_nested_query(uri.query).deep_merge(params).to_query.presence }.to_s
      end
  end
end
