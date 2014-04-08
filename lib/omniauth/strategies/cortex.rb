require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Cortex < OmniAuth::Strategies::OAuth2
      option :name, 'cortex'

      option :client_options, {
          :site => 'http://stg.api.cbcortex.com/api/v1',
          :authorize_url => 'http://stg.api.cbcortex.com/oauth/authorize',
          :token_url => 'http://stg.api.cbcortex.com/oauth/access_token'
      }

      uid{ raw_info['id'] }

      info do
        {
            :nickname => raw_info['email'],
            :email => raw_info['email'],
            :name => raw_info['fullname'],
            :first_name => raw_info['firstname'],
            :last_name => raw_info['lastname'],
            :image => raw_info['gravatar']
        }
      end

      extra do
        {:raw_info => raw_info}
      end

      def raw_info
        @raw_info ||= access_token.get('/users/me').parsed
      end
    end
  end
end
