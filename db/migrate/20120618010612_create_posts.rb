class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.integer :post_number
      t.integer :user_id
      t.integer :rank, default: 0
      t.integer :parent_post_number, default: nil

      t.timestamps
    end
    add_index :posts, [:user_id, :rank]
  end
end
