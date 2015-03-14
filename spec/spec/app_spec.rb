require File.join(File.dirname(__FILE__), '/spec_helper')

describe 'MyApp' do
	include Rack::Test::Methods

	it 'should receive the home page' do
		get '/'
		last_response.status.should == 200
	end

	it 'should receive the env page' do
		get '/env'
		last_response.status.should == 200
	end
end