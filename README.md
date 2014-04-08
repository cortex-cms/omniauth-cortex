# Omniauth::Cortex

OmniAuth strategy for Cortex's OAuth 2.0 implementation

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
  provider :cortex
end
```
