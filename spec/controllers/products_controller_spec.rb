require 'rails_helper'

RSpec.describe 'Products', type: :request do
  describe 'GET /products' do
    it 'returns a 200 status code', :dox do
      post user_registration_path(:email => 'email@email.com', :password => 'qwertyuiop')
      post user_session_path(:email => 'email@email.com', :password => 'qwertyuiop')
      
      access_token = response.header["access-token"]
      client = response.header["client"]
      uid = response.header["uid"]
      
      get products_path, headers: {
        'access-token' => access_token,
        'client' => client,
        'uid' => uid
      }
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /products' do
    it 'returns a 401 status code', :dox do
      post user_registration_path(:email => 'email@email.com', :password => 'qwertyuiop')
      post user_session_path(:email => 'email@email.com', :password => 'qwertyuiop')

      access_token = response.header["access-token"]
      client = response.header["client"]
      uid = response.header["uid"]

      get products_path, headers: {
        'access-token' => 'dqwieqwro',
        'client' => client,
        'uid' => uid
      }
      expect(response).to have_http_status(401)
    end
  end
end
