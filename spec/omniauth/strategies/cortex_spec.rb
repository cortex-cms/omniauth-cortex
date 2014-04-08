require 'spec_helper'

describe OmniAuth::Strategies::Cortex do
  let(:access_token) { stub('AccessToken', :options => {}) }
  let(:parsed_response) { stub('ParsedResponse') }
  let(:response) { stub('Response', :parsed => parsed_response) }

  let(:local_site) { 'http://localhost:3000/api/v1' }
  let(:local_authorize_url) { 'http://localhost:3000/oauth/authorize' }
  let(:local_token_url) { 'http://localhost:3000/oauth/access_token' }
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
    subject.stub!(:access_token).and_return(access_token)
  end

  context "client options" do
    it 'should have correct site' do
      subject.options.client_options.site.should eq('http://stg.api.cbcortex.com/api/v1')
    end

    it 'should have correct authorize url' do
      subject.options.client_options.authorize_url.should eq('http://stg.api.cbcortex.com/oauth/authorize')
    end

    it 'should have correct token url' do
      subject.options.client_options.token_url.should eq('http://stg.api.cbcortex.com/oauth/access_token')
    end

    describe "should be overrideable" do
      it "for site" do
        local.options.client_options.site.should eq(local_site)
      end

      it "for authorize url" do
        local.options.client_options.authorize_url.should eq(local_authorize_url)
      end

      it "for token url" do
        local.options.client_options.token_url.should eq(local_token_url)
      end
    end
  end

  context "#raw_info" do
    it "should use relative paths" do
      access_token.should_receive(:get).with('/users/me').and_return(response)
      subject.raw_info.should eq(parsed_response)
    end
  end

end
