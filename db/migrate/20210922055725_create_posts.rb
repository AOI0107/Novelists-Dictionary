class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts, do |t|
      t.references :user, null: false, foreign_key: true
      t.string :body

      t.timestamps
    end
    add_index :Posts, [:user_id,:category_id,:created_at]
  end
end
