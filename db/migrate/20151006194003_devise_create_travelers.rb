class DeviseCreateTravelers < ActiveRecord::Migration
  def change
    create_table(:travelers) do |t|
      t.string  :name
      t.string  :mobile_number
      t.string  :email
      t.string  :otp_secret_key
      t.integer :otp_counter

      t.timestamps null: false
    end

    add_index :travelers, :mobile_number, unique: true
  end
end
