require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  describe 'POST /auth (Sign Up process)' do
    it 'Should respond with status 200(OK)' do
      post user_registration_path(:email => 'email@email.com', :password => 'qwertyuiop')
      expect(response).to have_http_status(200)
    end

    it 'Should respond with status 200(OK)' do
      expect{
        post user_registration_path(:email => 'email@email.com', :password => 'qwertyuiop')
      }.to change(User, :count).by(1)
    end
  end

  describe 'POST /auth/sign_in (Sign In process)' do
    it 'Should respond with status 200(OK)' do
      # Sign Up
      post user_registration_path(:email => 'email@email.com', :password => 'qwertyuiop')
      post user_session_path(:email => 'email@email.com', :password => 'qwertyuiop')

      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /auth/sign_in failed request' do
    it 'Should respond with status 401(Unauthorized)' do
      # #Sign In
      post user_session_path(:email => 'email2@email.com', :password => 'qwertyuiop')
      
      expect(response).to have_http_status(401)
    end
  end
end
