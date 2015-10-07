require 'rails_helper'

RSpec.describe QuizController, type: :controller do

  describe "GET #login" do
    it "returns http success" do
      get :login
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #answer" do
    it "returns http success" do
      get :answer
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #finish" do
    it "returns http success" do
      get :finish
      expect(response).to have_http_status(:success)
    end
  end

end
