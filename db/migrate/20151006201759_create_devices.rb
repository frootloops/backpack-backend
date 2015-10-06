class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.references :traveler, index: true, foreign_key: true
      t.string :name
      t.string :uuid
      t.string :access_token
      t.string :push_token

      t.timestamps null: false
    end

    add_index :devices, :uuid, unique: true
    add_index :devices, :access_token, unique: true
    add_index :devices, :push_token, unique: true
  end
end
