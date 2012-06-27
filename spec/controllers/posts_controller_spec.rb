require 'spec_helper'

describe PostsController do

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy'
      response.should be_success
    end
  end

  describe "GET 'correct_user'" do
    it "returns http success" do
      get 'correct_user'
      response.should be_success
    end
  end

end
