class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.string :message, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
