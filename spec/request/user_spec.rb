require 'rails_helper'

RSpec.describe 'User', type: :request do
  
  before(:each) do
    User.destroy_all
    user1 = User.new!(:user) 
    user1.skip_confirmation!
    user1.save!
    sign_in user1
  end

  describe 'get /user' do
    it 'returns user details' do   
        get 'user/1'
        expect(response).to have_http_status(:success)
    end

    it 'edits user' do   
      patch 'user/edit_user/1', params: { user: { first_name:'EDITEDasddd'} }
      expect(User.last.first_name).to eq('EDITEDasddd')
      expect(response).to have_http_status(:success)
    end
  end
end
