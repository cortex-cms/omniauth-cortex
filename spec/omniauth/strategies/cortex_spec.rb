require 'spec_helper'

describe OmniAuth::Strategies::Cortex do
  let(:access_token) { double('AccessToken', :options => {}) }
  let(:parsed_response) { double('ParsedResponse') }
  let(:response) { double('Response', :parsed => parsed_response) }

  let(:local_site) { 'http://localhost:3000/api/v1' }
  let(:local_authorize_url) { 'http://localhost:3000/oauth/authorize' }
  let(:local_token_url) { 'http://localhost:3000/oauth/token' }
  let(:local) do
    OmniAuth::Strategies::Cortex.new('CORTEX_KEY', 'CORTEX_SECRET',
                                     {
                                         :client_options => {
                                             :site => local_site,
                                             :authorize_url => local_authorize_url,
                                             :token_url => local_token_url
                                         }
                                     }
    )
  end

  subject do
    OmniAuth::Strategies::Cortex.new({})
  end

  before(:each) do
    allow(subject).to receive(:access_token).and_return(access_token)
  end

  context "client options" do
    it 'should have correct site' do
      expect(subject.options.client_options.site).to eq('http://api.cbcortex.com/api/v1')
    end

    it 'should have correct authorize url' do
      expect(subject.options.client_options.authorize_url).to eq('http://api.cbcortex.com/oauth/authorize')
    end

    it 'should have correct token url' do
      expect(subject.options.client_options.token_url).to eq('http://api.cbcortex.com/oauth/token')
    end

    describe "should be overrideable" do
      it "for site" do
        expect(local.options.client_options.site).to eq(local_site)
      end

      it "for authorize url" do
        expect(local.options.client_options.authorize_url).to eq(local_authorize_url)
      end

      it "for token url" do
        expect(local.options.client_options.token_url).to eq(local_token_url)
      end
    end
  end

  context "#raw_info" do
    it "should use relative paths" do
      expect(access_token).to receive(:get).with('users/me').and_return(response)
      expect(subject.raw_info).to eq(parsed_response)
    end
  end

end
