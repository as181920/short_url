module ShortUrl
  module AuthGuard
    extend ActiveSupport::Concern

    NotAllowedRemoteIpError = Class.new(StandardError)

    included do
      rescue_from NotAllowedRemoteIpError, with: :handle_authenticate_remote_ip_failure
    end

    module ClassMethods
    end

    private
      def authenticate_remote_ip_in_whitelist
        unless request.remote_ip.in?(ENVConfig.remote_ip_whitelist.to_s.split(","))
          logger.error "remote ip not in whitelist: #{request.remote_ip}"
          raise NotAllowedRemoteIpError, "remote ip not in whitelist: #{request.remote_ip}"
        end
      end

      def handle_authenticate_remote_ip_failure
        respond_to do |format|
          format.html { render plain: "请确认访问客户端已加入IP白名单", status: :forbidden }
          format.json { render json: {error: {message: "Not in ip whitelist"}}, status: :forbidden }
        end
      end
  end
end
