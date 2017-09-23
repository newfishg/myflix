require 'spec_helper'

describe VideosController do
  describe "GET show" do
    it 'sets @video for authenticated user' do
      session[:user_id] = Fabricate(:user).id
      video = Fabricate(:video)
      get :show, id: video.id
      expect(assigns(:video)).to eq(video)
    end
  
    it 'redirects the user to the sign in page for unahthenticated users' do
      video = Fabricate(:video)
      get :show, id: video.id
      expect(response).to redirect_to sign_in_path
    end
  end

  describe 'Post search' do
    it 'sets @results for authenticated users' do
      session[:user_id] = Fabricate(:user).id
      futurama = Fabricate(:video, title: 'Futurama')
      get :search, search_term: 'rama'
      expect(assigns(:results)).to eq([futurama])
    end

    it 'redirects to sign in page for the unahthenticate users' do
      futurama = Fabricate(:video, title: 'Futurama')
      get :search, search_term: 'rama'
      expect(response).to redirect_to sign_in_path
    end
  end
end