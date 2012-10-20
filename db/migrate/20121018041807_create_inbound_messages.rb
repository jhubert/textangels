class CreateInboundMessages < ActiveRecord::Migration
  def change
    create_table :inbound_messages do |t|
      t.integer :person_id
      t.integer :conversation_id
      t.string :request_type
      t.string :message
      t.integer :status

      t.timestamps
    end
  end
end
