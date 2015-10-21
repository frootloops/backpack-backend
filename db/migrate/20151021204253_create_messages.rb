class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :conversation, index: true, foreign_key: true
      t.text :body, null: false, default: ""

      t.timestamps null: false
    end
  end
end
