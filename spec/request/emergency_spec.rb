require 'rails_helper'

RSpec.describe 'Admin', type: :request do
    
    let(:user1) { User.new!(:user) }

    before(:each) do
        User.destroy_all
        user1.skip_confirmation!
        user1.save!
        sign_in user1
    end

    describe 'post /emergency' do
        it 'posts an emergency' do   
            post '/emergency', params: {type:'police', longitude: 123.5, latitude: 10.2, user_id:user1.id}
            expect(response).to have_http_status(:success)
            expect(Emergency.count).to eq(1)
        end
    end

    describe 'delete /emergency' do
        it 'deletes an emergency' do
            post '/emergency', params: {type:'police', longitude: 123.5, latitude: 10.2, user_id:user1.id}
            delete '/emergency/1'
            expect(response).to have_http_status(:success)
            expect(Emergency.count).to eq(0)
        end
    end
end