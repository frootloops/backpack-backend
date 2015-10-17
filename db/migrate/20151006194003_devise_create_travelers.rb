class DeviseCreateTravelers < ActiveRecord::Migration
  def change
    create_table(:travelers) do |t|
      t.string  :name
      t.string  :phone
      t.string  :email
      t.string  :otp_secret_key
      t.integer :otp_counter
      t.string  :encrypted_password, null: false, default: ""
      t.string  :device_token
      t.string  :access_token
      t.string  :push_token

      t.timestamps null: false
    end

    add_index :travelers, :phone, unique: true
    add_index :travelers, :device_token, unique: true
    add_index :travelers, :access_token, unique: true
  end
end
