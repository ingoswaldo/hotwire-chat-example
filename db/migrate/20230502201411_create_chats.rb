class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.references :creator, null: false, foreign_key: { to_table: :users }, index: false
      t.references :receiver, null: false, foreign_key: { to_table: :users }, index: false

      t.timestamps
    end

    add_index :chats, [:creator_id, :receiver_id], unique: true
  end
end
