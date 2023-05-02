class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.integer :status, null: false, default: 0
      t.references :chat, null: false, foreign_key: true
      t.string :message, nullable: false

      t.timestamps
    end
  end
end
