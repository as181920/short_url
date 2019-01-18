require_dependency "short_url/application_controller"

module ShortUrl
  class LinksController < ApplicationController
    before_action :authenticate_remote_ip_in_whitelist, only: [:create]

    def index
      render plain: "Welcome short url"
    end

    def show
      @original_url = ShortenerService.fetch(params[:short_id])
      if @original_url.present?
        redirect_to @original_url, status: :moved_permanently
      else
        render plain: "Short url not found", status: :not_found
      end
    end

    def create
      @short_url = ShortenerService.perform(link_params[:original_url])
      render json: {short_url: @short_url}, status: :created
    end

    private
      def link_params
        params.require(:link).permit(:original_url)
      end
  end
end
