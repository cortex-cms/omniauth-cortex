# OmniAuth::Cortex

[![Dependency Status](https://gemnasium.com/cb-talent-development/omniauth-cortex.svg)](https://gemnasium.com/cb-talent-development/omniauth-cortex)

OmniAuth strategy for Cortex's OAuth 2.0 implementation.

[omniauth-github](https://github.com/intridea/omniauth-github) was used as a helpful model for this project.

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-cortex'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-cortex

## Usage

```ruby
use OmniAuth::Builder do
  provider :cortex, ENV['CORTEX_KEY'], ENV['CORTEX_SECRET'], scope: 'scope1, scope2, scope3'
end
```

## Override Environment

If you would like to change the URLs used by omniauth-cortex, override :client_options in the provider config step.

```ruby
provider :cortex, ENV['CORTEX_KEY'], ENV['CORTEX_SECRET'], scope: 'scope1, scope2, scope3',
  {
    :client_options => {
      :site => 'http://localhost:3000/api/v1',
      :authorize_url => 'http://localhost:3000/oauth/authorize',
      :token_url => 'http://localhost:3000/oauth/access_token'
    }
  }
```
