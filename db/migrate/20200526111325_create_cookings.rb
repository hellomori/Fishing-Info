class CreateCookings < ActiveRecord::Migration[5.2]
  def change
    create_table :cookings do |t|
      t.string :title, null: false
      t.string :image, null: false
      t.timestamps
    end
  end
end
