require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET /new " do
    it "responds with 200" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /" do
    it "responds with 200" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(response).to redirect_to(posts_url)
    end

    it "creates a post" do
      post :create, params: { post: { message: "Hello, world!" } }
      expect(Post.find_by(message: "Hello, world!")).to be
    end
  end

  describe "GET /" do
    it "responds with 200" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH /" do
    it "updates a post" do
      post :create, params: { post: { id: 1, message: "Hello, world!" } }
      patch :update, params: { post: { id: 1, message: "Hello, everyone!" } }
      p Post.find_by(id: 1)
      # p Post.find_by(id: 1).messsage
      expect(Post.find_by(id: 1).message).not_to eq "Hello, world!"
      expect(Post.find_by(id: 1).message).to eq "Hello, everyone!"
    end
  end

end
