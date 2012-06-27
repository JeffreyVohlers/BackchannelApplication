require 'spec_helper'

describe Post do

  before { @post = user.posts.build(content: "here is a sample post for the content") }

  subject { @post }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:parent_post_number) }
  it { should respond_to(:post_number) }
  it { should respond_to(:rank) }

  its(:user) { should == user }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Post.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "when user_id is not present" do
    before { @post.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @post.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @mpost.content = "a" * 255 }
    it { should_not be_valid }
  end
end