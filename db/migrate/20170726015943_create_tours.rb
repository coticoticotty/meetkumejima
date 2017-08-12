class CreateTours < ActiveRecord::Migration[5.0]
  def change
    create_table :tours do |t|
      t.string :title
      t.string :duration
      t.string :price
      t.string :tour_image
      t.string :category
      t.string :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
