class CreateUserPosts < ActiveRecord::Migration
  def change
    create_table :user_posts do |t|
    	t.integer :post_id
    	t.integer :user_id
      t.timestamps
    end
  end
end
