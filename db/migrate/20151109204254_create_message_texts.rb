class CreateMessageTexts < ActiveRecord::Migration
  def change
    create_table :message_texts do |t|
      t.text :body

      t.timestamps null: false
    end
  end
end
