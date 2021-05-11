class CreateSharks < ActiveRecord::Migration[5.2]
  def change
    create_table :sharks do |t|
      t.string :name
      t.string :color
      t.integer :age
      t.timestamps null: false
    end
  end
end
