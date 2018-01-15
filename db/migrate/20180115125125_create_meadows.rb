class CreateMeadows < ActiveRecord::Migration[5.1]
  def change
    create_table :meadows do |t|
      t.references :restaurant, foreign_key: true, index: true, null: false
      t.string :name, null: false
      t.decimal :price, null: false

      t.timestamps
    end
  end
end
