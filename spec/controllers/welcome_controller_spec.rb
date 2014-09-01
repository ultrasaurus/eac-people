require 'spec_helper'

describe WelcomeController do
  describe "GET index" do
    it "succeeds" do
      get :index
      expect(response).to be_success
    end
  end
end
