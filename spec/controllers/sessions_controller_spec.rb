require 'spec_helper'

describe SessionsController do
  describe "GET new" do
    it "renders the new template for unauthenticated users" do
      get :new
      expect(response).to render_template :new
    end
    it "redirects to the home page for authenticated users" do
      session[:user_id] = Fabricate(:user).id
      get :new
      expect(response).to redirect_to home_path
    end
  end

  describe "POST create" do
    let(:alice) { Fabricate(:user)}
    context "with valid credentials" do
      it "puts the signed in user in the session" do
        post :create, email: alice.email, password: alice.password
        expect(session[:user_id]).to eq(alice.id)
      end
      it "redirects to the home page" do
        post :create, email: alice.email, password: alice.password
        expect(response).to redirect_to home_path
      end
      it "sets the notice" do
        post :create, email: alice.email, password: alice.password
        expect(flash[:notice]).not_to be_blank
      end
    end

    context "with invalid credentials" do
      it "does not put the signed in user in the session" do
        post :create, email: alice.email, password: alice.password + '12345'
        expect(session[:user_id]).to be_nil
      end
      it "redirect to sign in path" do
        post :create, email: alice.email, password: alice.password + '12345'
        expect(response).to redirect_to sign_in_path
      end

      it "sets the error message" do
        post :create, email: alice.email, password: alice.password + '12345'
        expect(flash[:error]).not_to be_blank
      end
    end
  end

  describe "GET destroy" do
    before do
      session[:user_id] = Fabricate(:user).id
      get :destroy
    end

    it "clears the session for the user" do
      expect(session[:user_id]).to be_nil
    end
    it "redirect to root path" do
      expect(response).to redirect_to root_path
    end

    it "set the notice" do
      expect(flash[:notice]).not_to be_blank
    end
  end
end