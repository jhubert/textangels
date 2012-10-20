class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :phone
      t.string :key
      t.string :city
      t.string :state
      t.string :zip
      t.boolean :blocked

      t.timestamps
    end
  end
end
