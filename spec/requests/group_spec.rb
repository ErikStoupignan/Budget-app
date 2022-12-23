require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/groups', type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) do
    User.create(
      name: 'angel',
      email: 'angel@gmail.com',
      password: '1234567'
    )
  end

  let(:category) do
    user.groups.create(
      name: 'Food',
      icon: 'http://fasfa-utensils',
      user_id: user.id
    )
  end

  describe 'GET /groups' do
    before do
      sign_in user
      get groups_path
    end

    it 'returns all groups/categories' do
      get '/groups'
      expect(response).to have_http_status(200)
    end

    it 'responds html' do
      expect(response.content_type).to include 'text/html'
    end
  end

  describe 'GET /categories' do
    before do
      sign_in user
      get new_group_path
    end

    it 'returns new category' do
      get '/groups/new'
      expect(response).to have_http_status(200)
    end

    it 'respons to html' do
      expect(response.content_type).to include 'text/html'
    end
  end
end