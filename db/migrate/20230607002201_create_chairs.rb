class CreateChairs < ActiveRecord::Migration[7.0]
  def change
    create_table :chairs do |t|
      t.string :name
      t.string :address
      t.integer :rating
      t.text :description
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
