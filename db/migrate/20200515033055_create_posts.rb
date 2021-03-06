class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :area, null: false
      t.string :image, null: false
      t.string :rank, null: false
      t.timestamps
    end
  end
end
