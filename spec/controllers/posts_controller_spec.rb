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

    # let(:current_user) { double :current_user, id: 1 }

    it "updates a post" do

      post = Post.create({ message: "Hello world!" })
      patch :update, params: { id: "#{post.id}", post: { message: "Hello, everyone!" } }
      p Post.find_by(id: "#{post.id}")
      # p Post.find_by(id: 1).messsage
      expect(Post.find_by(id: "#{post.id}").message).not_to eq "Hello, world!"
      expect(Post.find_by(id: "#{post.id}").message).to eq "Hello, everyone!"
    end
  end

end
