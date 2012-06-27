class Post < ActiveRecord::Base
  attr_accessible :content, :parent_post_number, :post_number, :rank
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }

  default_scope order: 'posts.rank DESC'

end
