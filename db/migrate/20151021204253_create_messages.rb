class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :conversation, index: true, foreign_key: true
      t.references :message, polymorphic: true

      t.datetime :read_at
      t.timestamps null: false
    end
  end
end
