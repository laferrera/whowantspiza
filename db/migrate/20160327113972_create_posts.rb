class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      t.timestamps null: false
      t.text :body, null: false
      t.integer :grid_image_id, null: true
      t.string :title, null: false
      t.references :user
    end
  end
end
