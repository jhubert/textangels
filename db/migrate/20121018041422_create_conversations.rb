class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.string  :key
      t.integer :person_id
      t.integer :user_id
      t.integer :inbound_message_id
      t.boolean :active, :default => true
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
