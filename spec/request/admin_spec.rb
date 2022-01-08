require 'rails_helper'

RSpec.describe 'Admin', type: :request do
    
    before(:each) do
        User.destroy_all
        admin = User.new!(:admin) 
        admin.skip_confirmation!
        admin.save!
        sign_in admin

        user1 = User.new!(:user) 
        user1.skip_confirmation!
        user1.save!

        user2 = User.new!(:user_in_emergency) 
        user2.skip_confirmation!
        user2.save!     
    end

    describe 'get /admin' do
        it 'returns users with emergency' do   
            get 'admin/emergency'
            expect(JSON.parse(response.body).count).to eq(1)
        end

        it 'returns all non-admin users' do
            get 'admin/users'
            expect(JSON.parse(response.body).count).to eq(2)
            expect(response).to have_http_status(:success)
        end
    end

    describe 'post/admin' do
        it 'adds new user' do   
            post 'admin/add_user', params: { user: { email:'user3@test.com', first_name:'asddd', last_name:'asddd', password:'testpass', password_confirmation:'testpass'} }
            expect(response).to have_http_status(:success)
        end

        it 'edits user' do   
            patch 'admin/edit_user/3', params: { user: { first_name:'EDITEDasddd'} }
            expect(User.last.first_name).to eq('EDITEDasddd')
            expect(response).to have_http_status(:success)
        end

        it 'deletes user' do   
            delete 'admin/delete/2'
            expect(User.count).to eq(2)
            expect(response).to have_http_status(:success)
        end
    end
end
