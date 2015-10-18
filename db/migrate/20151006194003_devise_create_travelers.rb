class DeviseCreateTravelers < ActiveRecord::Migration
  def change
    create_table(:travelers) do |t|
      t.string  :name,  null: false, default: ""
      t.string  :phone, null: false, default: ""
      t.string  :email, null: false, default: ""
      t.string  :otp_secret_key
      t.integer :otp_counter
      t.string  :encrypted_password, null: false, default: ""
      t.string  :authentication_token
      t.string  :device_token
      t.string  :push_token, null: false, default: ""
      t.string  :locale, null: false, default: "en_US"

      t.timestamps null: false
    end

    add_index :travelers, :authentication_token, unique: true
    add_index :travelers, :device_token, unique: true
  end
end
