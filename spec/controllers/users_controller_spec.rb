require 'spec_helper'

describe UserController do

  describe "GET 'create_user'" do
    it "returns http success" do
      get 'create_user'
      response.should be_success
    end
  end

end
