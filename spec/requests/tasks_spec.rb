require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /react" do
    it "returns http success" do
      get "/tasks/react"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /offer" do
    it "returns http success" do
      get "/tasks/offer"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/tasks/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /tasks_data" do
    it "returns http success" do
      get "/tasks/tasks_data"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /test" do
    it "returns http success" do
      get "/tasks/test"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /task" do
    it "returns http success" do
      get "/tasks/task"
      expect(response).to have_http_status(:success)
    end
  end

end
