require 'spec_helper'

describe User do
  before do
    @user = User.new(username: "Example User", password: "foobarer")

  subject { @user }

    it { should respond_to(:username) }
    it { should respond_to(:password_digest) }
    it { should respond_to(:password) }
    it { should respond_to(:remember_token) }
    it { should respond_to(:is_admin) }
    it { should respond_to(:authenticate) }
    it { should respond_to(:posts) }
    it { should be_valid }
    it { should_not be_admin }

    describe "accessible attributes" do
      it "should not allow access to admin" do
        expect do
          User.new(admin: true)
        end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
      end
    end

    describe "with admin attribute set to 'true'" do
      before { @user.toggle!(:is_admin) }
      it { should be_admin }
    end

    describe "when name is not present" do
      before { @user.username = " " }
      it { should_not be_valid }
    end


    describe "when username is already taken" do
      before do
        user_with_same_username = @user.dup
        user_with_same_username.username = @user.username.downcase
        user_with_same_username.save
      end
      it { should_not be_valid }
    end

    describe "username with mixed case" do
      let(:mixed_case_username) { "SampLeUserNaMe" }
      it "should be saved as all lower-case" do
        @user.username = mixed_case_username
        @user.save
        @user.reload.username.should == mixed_case_username.downcase
      end
    end

    describe "when password is not present" do
      before { @user.password = @user.password_confirmation = " " }
      it { should_not be_valid }
    end

    describe "return value of authenticate method" do
      before { @user.save }
      let(:found_user) { User.find_by_username(@user.username) }

      describe "with valid password" do
        it { should == found_user.authenticate(@user.password) }
      end

      describe "with invalid password" do
        let(:user_for_invalid_password) { found_user.authenticate("invalid") }

        it { should_not == user_for_invalid_password }
        specify { user_for_invalid_password.should be_false }
      end
    end

    describe "post associations" do

      before { @user.save }
      it "should destroy associated posts" do
        posts = @user.posts
        @user.destroy
        posts.each do |post|
          Post.find_by_id(post.id).should be_nil
        end
      end
    end
  end
end
