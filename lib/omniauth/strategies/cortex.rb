require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Cortex < OmniAuth::Strategies::OAuth2
      option :name, 'cortex'

      option :client_options, {
        :site          => 'https://cbcortex.com/api/v1',
        :authorize_url => 'https://cbcortex.com/oauth/authorize',
        :token_url     => 'https://cbcortex.com/oauth/token'
      }

      uid{ raw_info['id'] }

      info do
        {
          :email      => raw_info['email'],
          :full_name  => raw_info['fullname'],
          :first_name => raw_info['firstname'],
          :last_name  => raw_info['lastname'],
          :image      => raw_info['gravatar']
        }
      end

      extra do
        { :raw_info => raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get('users/me').parsed
      end
    end
  end
end
