class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.references :traveler, index: true, foreign_key: true
      t.string :title, null: false, default: ""

      t.timestamps null: false
    end
  end
end
