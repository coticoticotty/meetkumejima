class CreateChatboxes < ActiveRecord::Migration[5.0]
  def change
    create_table :chatboxes do |t|
      t.string :message
      t.references :user, foreign_key: true
      t.references :tour, foreign_key: true

      t.timestamps
    end
  end
end
