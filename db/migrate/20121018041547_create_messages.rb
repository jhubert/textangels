class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :key
      t.integer :conversation_id
      t.string :from_type
      t.string :from_id
      t.text :body
      t.timestamps
    end
  end
end
